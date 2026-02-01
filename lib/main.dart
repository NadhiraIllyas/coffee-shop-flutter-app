import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'screens/signup.dart';
=======
import 'screens/login_screen.dart';
>>>>>>> 17c3deccfbdb4351c983002be4fbaad0712da044
=======
import 'screens/login_screen.dart';
import 'screens/signup.dart';
>>>>>>> 93132947e00c582942449f4d8092607c05e48bf9

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // start app with login
    );
  }
}