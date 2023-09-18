import 'package:flutter/material.dart';
// import 'package:jobservice_ia/services/employee_service.dart';

import 'home.dart';
import 'widgets/app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context,'Servicios',true),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(4, (index) => const Home()),
      ),
    );
  }
}
