import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../components/already_have_an_account_check.dart';
import '../../../../../components/rounded_button.dart';
import '../../../../../components/rounded_input_field.dart';
import '../../../../../components/rounded_password_field.dart';
import '../../../Home/home_screen.dart';
import '../../SignIn/signin_screen.dart';
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
  final nameController = TextEditingController(); 
  final lastNameController = TextEditingController(); 
  final passwordController = TextEditingController(); 
  final phoneNumberController = TextEditingController();

  
  final firebaseInstance = FirebaseFirestore.instance;
  

  _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );
      
      firebaseInstance.collection("usuarios").add({
        "email": emailController.text,
        "name": nameController.text,
        "lastname": lastNameController.text,
        "password": passwordController.text,
        "phonenumber" : phoneNumberController.text,
      });

      setState(() {});

      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));

    } on FirebaseAuthException catch (e) {
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'El email introducido no es valido';
          break;
      }
      
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Error al Inciar'),
          content: Text(message),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text('Ok'))
          ],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            const Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: Color(0xFFE65100)),
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
              onChanged: (value) {}
            ),
            RoundedButton(
              text: "Registrar", 
              press: () => _signUp()
            ),

            // SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignInScreen();
                    },
                  ),
                );
              },
            ),
            /*
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
      */
          ],
        ),
      ),
    );
  }
}
