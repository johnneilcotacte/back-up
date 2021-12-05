import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = Provider<LoginData>((ref) {
  return LoginData();
});

class LoginData {
  bool passwordVisible = false;
  final emailcontroller = TextEditingController();
  final password = TextEditingController();

  // bool get passwordVisible => _passwordVisible;
  // String get email => _email;
  // String get password => _password;
}
