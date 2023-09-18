import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobservice_ia/screens/home_options.dart';
import 'package:jobservice_ia/screens/login_screen.dart';
import 'package:jobservice_ia/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'background_painter.dart';
import 'config/theme/app_theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initialization = Firebase.initializeApp();

  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Auth',
          theme: AppTheme(selectedColor: 0).theme(),
          home: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);
              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return const HomeOptions();
              } else {
                return const LoginScreen();
              }
            },
          ),
        ),
        );
      },
    );
  }

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          const Center(child: CircularProgressIndicator()),
        ],
      );
}
