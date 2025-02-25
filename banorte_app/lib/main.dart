// main.dart
import 'package:flutter/material.dart';
import 'screens/pre_login_screen.dart';
import 'package:screen_protector/screen_protector.dart';//Anti-ScreenShot
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import generated firebase_options.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import generated firebase_options.dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer'; // Import for using log

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use firebase_options.dart
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler); // Set background handler
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