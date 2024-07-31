import 'package:flutter/material.dart';
import 'package:summerproject/speech_to_text_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SpeechToTextDemo(),
    );
  }
}
