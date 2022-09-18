// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'textControl.dart';
import 'text.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var txt = "Some Text";

  String changeText() {
    if (txt == "Some Text") {
      setState(() {
        txt = "Some Other Text";
      });
    } else {
      setState(() {
        txt = "Some Text";
      });
    }
    return txt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("My App")),
            body: Container(
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(txt),
                      TextControl(changeText: changeText),
                    ]))));
  }
}
