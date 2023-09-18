import 'package:flutter/material.dart';

import 'components/body.dart';

class SaveManual extends StatelessWidget {
  const SaveManual({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        centerTitle: true,
        title: const Text(
          "Registrar mi Servicios",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Body(),
    );
  }
}
