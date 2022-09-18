import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final VoidCallback changeText;

  TextControl({required this.changeText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: changeText, child: Text("Change"));
  }
}
