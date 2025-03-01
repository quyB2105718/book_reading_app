// Main.dart
import 'package:flutter/material.dart';
import 'ui/main_page.dart'; // Import the main page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reading App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookListScreen(), // Set the main page as the home screen
    );
  }
}
