import 'package:flutter/material.dart';
import 'welcome_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delayed navigation function
    void navigateToNextPage() {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      });
    }

    // Call the delayed navigation function when the screen builds
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      navigateToNextPage();
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/donut.png', // Replace with your app logo image asset path
              width: 300.0,
              height: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
