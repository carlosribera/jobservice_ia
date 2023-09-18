import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/components_all.dart';
import 'home_options.dart';
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
          .push(MaterialPageRoute(builder: (context) => const HomeOptions()));
    } on FirebaseAuthException catch (e) {
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'El email introducido no es valido';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.03),
          const Text(
            "REGISTRATE",
            style: TextStyle(
                fontWeight: FontWeight.bold,
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
            },
          ),
        ],
      ),
    );
  }
}
