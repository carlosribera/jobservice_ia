import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobservice_ia/screens/JobService/widgets/app_bar.dart';

import 'login_screen.dart';

// import 'JobService/widgets/app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, 'Mi Perfil', false),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 45),
            child: Row(children: const [
              CircleAvatar(
                maxRadius: 50,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Andres Ribera",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Ajustes'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.headset_mic_outlined),
                    title: const Text('Soporte'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.receipt),
                    title: const Text('Privacidad'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Sobre Jobservice'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Cerrar Sesion'),
                    onTap: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        // ignore: avoid_print
                        print("Signed Out");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
