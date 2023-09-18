import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobservice_ia/config/theme/app_theme.dart';

// import 'package:provider/provider.dart';

// import '../../../provider/google_sign_in.dart';
import '../components/rounded_button.dart';
import 'JobService/main_screen.dart';
import 'JobService/utils/const.dart';
import 'RegisterEmployee/register_option.dart';

class HomeOptions extends StatelessWidget {
  static const routeName = '/HomeOptionScreen';

  const HomeOptions({Key key}) : super(key: key);
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
            SizedBox(height: size.height * 0.15),
            Muestra(
              src: "assets/images/search.svg",
              child: RoundedButton(
                text: "Buscar algun servicio",
                press: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) {
                    return const MainScreen();
                  }));
                },
              ),
            ),
            const SizedBox(height: 30),
            Muestra(
              src: "assets/images/offers.svg",
              child: RoundedButton(
                text: "Ofertas algun servicio",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterOption();
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
