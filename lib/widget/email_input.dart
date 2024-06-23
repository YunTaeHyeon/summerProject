import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool) onEmailChecked;

  EmailInput({required this.controller, required this.onEmailChecked});

  @override
  _EmailInputState createState() => _EmailInputState();
}

class _EmailInputState extends State<EmailInput> {
  Future<void> checkEmailDuplicate(BuildContext context) async {
    final String email = widget.controller.text;

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/check_email'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );

      if (response.statusCode == 200) {
        widget.onEmailChecked(true);
        showCompleteSnackBar(context, 'Email is available.');
      } else {
        widget.onEmailChecked(false);
        showSnackBar(context, 'Email is already in use.');
      }
    }
    catch (e) {
      showSnackBar(context, 'Server error occurred. Please try again later.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Enter email',
        suffixIcon: IconButton(
          icon: Icon(Icons.check),
          onPressed: () => checkEmailDuplicate(context),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

void showSnackBar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(
    content: Text(errorMessage),
    backgroundColor: Color.fromARGB(255, 112, 48, 48),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showCompleteSnackBar(BuildContext context, String errorMessage) {
  final snackBar = SnackBar(
    content: Text(errorMessage),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}