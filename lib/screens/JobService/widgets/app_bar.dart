import 'package:flutter/material.dart';

import '../../profile_screen.dart';
// import 'package:jobservice_ia/models/employee.dart';

getAppBar(context, String title, bool withAvatar) {
// getAppBar(String title, Employee user) {
  // String initials = user.nombres.substring(0,1)+user.apellidos.substring(0,1);
  if (withAvatar) { // si es true
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          child: const CircleAvatar(
            child: Text('AR'),
            // child: Text(initials),
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
  if (!withAvatar) {
    return AppBar(
      centerTitle: true,
      title: Text(title),
    );
  }
}
