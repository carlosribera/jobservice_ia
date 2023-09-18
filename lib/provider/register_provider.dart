import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider() {
    print('Inciando register_provider...');
  }

  Future<bool> registrarUsuario(Map<String, String> formData) async {
    return false;
  }
}