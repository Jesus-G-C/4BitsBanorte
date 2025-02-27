// main.dart
import 'package:flutter/material.dart';
import 'package:screen_protector/screen_protector.dart';
import 'screens/pre_login_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banorte App',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _protectScreen(); // Call the protection method in initState
  }

  Future<void> _protectScreen() async {
    await ScreenProtector.preventScreenshotOn(); // Or use preventScreenshotOn(), preventScreenRecordOn()
  }

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
