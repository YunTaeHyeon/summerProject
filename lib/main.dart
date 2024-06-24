import 'package:flutter/material.dart';
import 'screen/login_screen.dart';
import 'screen/welcome_page.dart';
import 'screen/start_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Start Page',
      home: StartScreen(),
    );
  }
}

