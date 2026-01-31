import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'screens/signup.dart';
=======
import 'screens/login_screen.dart';
>>>>>>> 17c3deccfbdb4351c983002be4fbaad0712da044

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
