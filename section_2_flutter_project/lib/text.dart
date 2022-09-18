import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String txt;

  CustomText(this.txt);

  @override
  Widget build(BuildContext context) {
    return Text(txt);
  }
}
