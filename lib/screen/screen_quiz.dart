import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_quiz.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizs;
  QuizScreen({required this.quizs});

  @override
  _QuizScreenState createState() => _QuizScreenState();

}

class _QuizScreenState extends State<QuizScreen> {

  List<int> answers = [-1, -1, -1];
  List<bool> answerState = [false, false, false, false];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double width = size.width;
    double height = size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepPurple),
            ), // BoxDecoration
            width: width * 0.85,
            height: height * 0.5,
            child: Swiper(
            physics: NeverScrollableScrollPhysics(),
            loop: false,
            itemCount: widget.quizs.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildQuizCard(widget.quizs[index], width, height);
            },
          ), // Swiper
          ), // Container
        ), // Center
      ), // Scaffold
    ); // SafeArea
  }

  Widget _buildQuizCard(Quiz quiz, double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple),
        color: Colors.white,
      ), // BoxDecoration
      child: Text(
        'Q' + (_currentIndex + 1).toString() + '.',
        style: TextStyle(
          fontSize: width * 0.06,
          fontWeight: FontWeight.bold,
        ), // TextStyle
      ),
    );
  }
}