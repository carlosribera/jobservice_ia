// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobservice_ia/presentation/screens/Home/home_options.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  const GoogleSignupButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(4),
      child: OutlinedButton.icon(
        label: const Text(
          'Sign In With Google',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          // highlightedBorderColor: Colors.black,
          // borderSide: BorderSide(color: Colors.black),
          // textColor: Colors.black,
        ),
        icon: FaIcon(FontAwesomeIcons.google, color: colors.primary),
        onPressed: () {
          signInWithGoogle(context);
          // final provider =
          //     Provider.of<GoogleSignInProvider>(context, listen: false);
          // provider.login();
        },
      ),
    );
    
  }
  signInWithGoogle(BuildContext context) async {
    GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    // ignore: avoid_print
    print(userCredential.user.displayName);
    if (userCredential.user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeOptions()));
    }
  }

}
