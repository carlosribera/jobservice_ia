import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:provider/provider.dart';

// import '../../../provider/google_sign_in.dart';
import '../auth/SignIn/signin_screen.dart';
import '../JobService/main_screen.dart';
import '../JobService/utils/const.dart';
import 'RegisterEmployee/register_option.dart';

class HomeOptions extends StatelessWidget {
  static const routeName = '/HomeOptionScreen';

  const HomeOptions({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.black87,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const StadiumBorder(),
    ).copyWith(
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            );
          }
          return null; // Defer to the widget's default.
        },
      ),
    );

    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              // ignore: avoid_print
              print("Signed Out");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            });
          },
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: size.height * 0.2),
            Muestra(
              src: "assets/images/search.svg",
              child: OutlinedButton.icon(
                  icon: const Icon(Icons.search),
                  style: outlineButtonStyle,
                  label: const Text(
                    'Buscar algun servicio',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MainScreen();
                    }));
                  }),
            ),
            const SizedBox(height: 30),
            Muestra(
              src: "assets/images/offers.svg",
              child: OutlinedButton.icon(
                  icon: const Icon(Icons.add),
                  style: outlineButtonStyle,
                  label: const Text(
                    'Ofertas algun servicio',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RegisterOption();
                    }));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Muestra extends StatelessWidget {
  final Widget child;
  final String src;

  const Muestra({
    Key key,
    @required this.child,
    @required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(src, width: size.width * 0.4),
          // Image.asset(this.src, width: size.width * 0.3),
          const SizedBox(height: 25),
          child,
        ],
      ),
    );
  }
}
