import 'package:flutter/material.dart';
import '../screen/login_screen.dart';
import 'signUp_screen.dart';
import 'next_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Image.asset(
                'images/donut.png', // Replace with your Kakao login image asset path
                width: 200.0,
                height: 200.0,
              ),
              const SizedBox(height: 20.0),
              const Text(
                '뉴스가 길다면',
                style: TextStyle(fontSize: 30.0),
              ),
              const Text(
                '요약해서 한입에',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 100.0),
              GestureDetector(
                onTap: () {
                  // Handle Kakao login tap
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NextPage()));
                },
                child: Image.asset(
                  'images/kakaoLogin.png', // Replace with your Kakao login button image asset path
                  height: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
