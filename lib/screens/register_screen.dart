import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobservice_ia/screens/JobService/main_screen.dart';

import '../components/components_all.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final firebaseInstance = FirebaseFirestore.instance;

  _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      firebaseInstance.collection("usuarios").add({
        "email": emailController.text,
        "name": nameController.text,
        "lastname": lastNameController.text,
        "password": passwordController.text,
        "phonenumber": phoneNumberController.text,
      });

      setState(() {});

      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MainScreen()));
    } on FirebaseAuthException catch (e) {
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'El email introducido no es valido';
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
      body: Stack(
        children: [
          _crearFondo(context),
          _registerForm(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoRojo = Container(
      height: size.height,
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
          color: const Color.fromRGBO(255, 255, 255, 0.15)),
    );

    return Stack(
      children: [
        fondoRojo,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, left: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
      ],
    );
  }

  Widget _registerForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: [
        SafeArea(
            child: Container(
          height: 100.0,
        )),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "REGISTRATE",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32.0,
                      color: Color(0xFFE65100)),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedInputField(
                  ctrl: nameController,
                  hintText: "Nombre",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  ctrl: lastNameController,
                  hintText: "Apellido",
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  ctrl: phoneNumberController,
                  hintText: "teléfono",
                  icon: Icons.phone,
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  ctrl: emailController,
                  hintText: "Correo electronico",
                  icon: Icons.email,
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                    ctrl: passwordController,
                    hintText: "Contraseña",
                    onChanged: (value) {}),
                RoundedButton(text: "Registrar", press: () => _signUp()),

                // SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    }),
              ]),
        ),
      ]),
    );
  }
}
