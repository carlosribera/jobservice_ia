import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../JobService/utils/const.dart';
import '../home_page.dart';
import 'Manual/form.dart';


class RegisterOption extends StatelessWidget {
  const RegisterOption({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      backgroundColor: Colors.black87, minimumSize: const Size(88, 36),
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



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Registra tu servicio",
          textAlign: TextAlign.center,
        )),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 50),
                  Muestra(
                    src: "assets/images/register_manual.svg",
                    child: OutlinedButton.icon(
                        icon: const Icon(Icons.search),
                        style: outlineButtonStyle,
                        label: const Text(
                          'Registo manual',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SaveManual();
                          }));
                        }),
                  ),
                  const SizedBox(height: 30),
                  Muestra(
                    src: "assets/images/register_asist.svg",
                    child: OutlinedButton.icon(
                        icon: const Icon(Icons.add),
                        style: outlineButtonStyle,
                        label: const Text(
                          'Usa nuestro asistente',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                        }),
                  ),
                ],
              )
            ],
          ),
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
