import 'package:flutter/material.dart';
import '../screen/login_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          /*
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),

           */
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // 웰컴 인사말과 로그인 버튼을 Column으로 묶어 세로로 배치
            children: <Widget>[
              const Image(
                image: AssetImage('images/donut.png'),
                width: 300.0,
                height: 300.0,
              ),
              const Text(
                'Welcome to the Donut Shop',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LogIn(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(200, 50),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('Log in'),
              ),
            ],
          )
        )
      ),
    );
  }
}