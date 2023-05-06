import 'package:flutter/material.dart';
import 'dart:async';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LoginApp());
}

// void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Login Page",
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.orange,
            primarySwatch: Colors.deepOrange),
        home: const HomePage());
  }
}
