import 'package:flutter/material.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        centerTitle: true,
        title: const Text(
          "Servicios",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(4, (index) => const Home()),
      ),
    );
  }
}
