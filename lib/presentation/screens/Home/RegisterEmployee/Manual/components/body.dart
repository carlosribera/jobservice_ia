import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../../components/rounded_button.dart';
import '../../../../../../components/rounded_input_field.dart';
import '../../../../../../constants.dart';
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
  final nombresController = TextEditingController();
  final apellidosController = TextEditingController();
  final edadController = TextEditingController();
  final categoriaController = TextEditingController();
  final descripcionController = TextEditingController();
  final emailController = TextEditingController();
  final telefonoController = TextEditingController();

  final firebaseInstance = FirebaseFirestore.instance;

  _signUp() async {
    firebaseInstance.collection("employee").add({
      "nombres": nombresController.text,
      "apellidos": apellidosController.text,
      "edad": edadController.text,
      "categoria": categoriaController.text,
      "descripcion": descripcionController.text,
      "email": emailController.text,
      "telefono": telefonoController.text,
    });

    setState(() {});

    Navigator.of(context)
        .pop();
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
              "Registrar mi Servicio",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: kPrimaryColor),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              ctrl: nombresController,
              hintText: "Nombres",
              onChanged: (value) {},
            ),
            RoundedInputField(
              ctrl: apellidosController,
              hintText: "Apellidos",
              onChanged: (value) {},
            ),
            RoundedInputField(
              ctrl: edadController,
              hintText: "Edad",
              onChanged: (value) {},
            ),
            RoundedInputField(
              ctrl: categoriaController,
              hintText: "Categoria",
              onChanged: (value) {},
            ),
            RoundedInputField(
              ctrl: descripcionController,
              hintText: "Descripcion",
              onChanged: (value) {},
            ),
            RoundedInputField(
              ctrl: emailController,
              hintText: "Correo electronico",
              icon: Icons.email,
              onChanged: (value) {},
            ),
            RoundedInputField(
              ctrl: telefonoController,
              hintText: "teléfono",
              icon: Icons.phone,
              onChanged: (value) {},
            ),

            RoundedButton(text: "Registrar", press: () => _signUp()),
          ],
        ),
      ),
    );
  }
}
