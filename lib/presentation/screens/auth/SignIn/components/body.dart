import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobservice_ia/presentation/screens/Home/home_options.dart';

import '../../../../../components/already_have_an_account_check.dart';
import '../../../../../components/google_signup_button_widget.dart';
import '../../../../../components/rounded_button.dart';
import '../../../../../components/rounded_input_field.dart';
import '../../../../../components/rounded_password_field.dart';
import '../../Signup/signup_screen.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      setState(() {});

      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomeOptions()));
    } on FirebaseAuthException catch (e) {
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'El email introducido no es valido';
          break;
        case 'user-disabled':
          message = 'El usuario esta deshabilitado';
          break;
        case 'user-not-found':
          message = 'El usuario no se encuentra';
          break;
        case 'wrong-password':
          message = 'contraseña incorrecta';
          break;
      }
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error al Inciar'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // User user = FirebaseAuth.instance.currentUser;

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              // 'Auth User (Logged ' + (user == null ? 'out' : 'in') + ')',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: colors.primary
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              ctrl: emailController,
              hintText: "Correo",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              ctrl: passwordController,
              hintText: "Contraseña",
              onChanged: (value) {},
            ),
            RoundedButton(text: "INGRESAR", press: () => _logIn()),
            SizedBox(
              height: size.height * 0.03,
            ),
            const GoogleSignupButtonWidget(),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
