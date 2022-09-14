import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final btnColor;
  final txt;
  Answer({this.selectHandler, this.btnColor, this.txt});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: TextButton.styleFrom(
            backgroundColor: btnColor, foregroundColor: Colors.white),
        child: Text(txt),
        onPressed: selectHandler,
      ),
    );
  }
}
