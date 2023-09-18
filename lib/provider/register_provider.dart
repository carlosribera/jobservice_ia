import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider() {
    // ignore: avoid_print
    print('Inciando register_provider...');
  }

  Future<bool> registrarUsuario(Map<String, String> formData) async {
    return false;
  }
}