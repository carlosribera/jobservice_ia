import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/components_all.dart';
import 'JobService/main_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _logIn(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      setState(() {});
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MainScreen()));
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
      // ignore: use_build_context_synchronously
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
    return Scaffold(
      body: Stack(children: [
        _crearFondo(context),
        _loginForm(context),
      ]),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoRojo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(207, 1, 52, 1.0),
        Color.fromRGBO(207, 5, 52, 1.0),
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: [
        fondoRojo,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, left: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Container(
          padding: const EdgeInsets.only(top: 90.0),
          child: Column(
            children: const [
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Job Service',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 180.0,
          )),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 30.0),
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 0.5),
                    spreadRadius: 3.0,
                  )
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  "Inicia Sesión",
                  // 'Auth User (Logged ' + (user == null ? 'out' : 'in') + ')',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                      color: colors.primary),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  icon: Icons.email,
                  ctrl: emailController,
                  hintText: "Correo",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  ctrl: passwordController,
                  hintText: "Contraseña",
                  onChanged: (value) {},
                ),
                const SizedBox(height: 30.0),
                RoundedButton(text: "INGRESAR", press: () => _logIn(context)),
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
                          return const RegisterScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
