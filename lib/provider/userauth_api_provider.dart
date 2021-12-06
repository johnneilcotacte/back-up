import 'package:flutter/material.dart';
import 'package:flutter_miniproject/api/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authAPIProvider = Provider<Authentication>((ref) {
  return Authentication();
});

class Authentication {
  final auth = AuthAPI();
}
