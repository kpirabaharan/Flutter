import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
      color: Colors.amber[600],
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
