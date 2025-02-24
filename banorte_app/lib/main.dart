// main.dart
import 'package:flutter/material.dart';
import 'screens/pre_login_screen.dart';

void main() {
  runApp(const BanorteApp());
}

class BanorteApp extends StatelessWidget {
  const BanorteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banorte',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF0000),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PreLoginScreen(), // Usa la pantalla PreLoginScreen separada
    );
  }
}