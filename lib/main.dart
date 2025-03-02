// Main.dart
import 'package:flutter/material.dart';
import 'ui/main_page.dart'; // Import the main page
import 'ui/signup_page.dart';
import 'ui/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reading App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Set the main page as the home screen
    );
  }
}
