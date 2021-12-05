import 'package:flutter/material.dart';
import 'package:flutter_miniproject/module/screens/homes_screen.dart';
import 'package:flutter_miniproject/module/screens/legit_login.dart';
import 'package:flutter_miniproject/module/screens/login.dart';
import 'package:flutter_miniproject/module/screens/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: HomePage(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
