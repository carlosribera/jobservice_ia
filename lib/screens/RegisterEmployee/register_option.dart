import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobservice_ia/components/rounded_button.dart';
import 'package:jobservice_ia/config/theme/app_theme.dart';

import '../JobService/utils/const.dart';
import 'Asistente/home_page.dart';
import 'Manual/form.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {   

    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: AppTheme(selectedColor: 0).theme(),
      // darkTheme: Constants.darkTheme,
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: size.height * 0.2),
            Muestra(
              src: "assets/images/register_manual.svg",
              child: RoundedButton(
                text: "Registro Manual",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SaveManual();
                  }));
                },
              ),
            ),
            const SizedBox(height: 30),
            Muestra(
              src: "assets/images/register_asist.svg",
              child: RoundedButton(
                text: "Registro Inteligente",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Home();
                  }));
                },
              ),
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
