import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    if (questionIndex == 0) {
      setState(() {
        questionIndex += 1;
      });
    } else {
      setState(() {
        questionIndex -= 1;
      });
    }
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];
    final colors = [
      'Blue',
      'Red',
      'Yellow',
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
              backgroundColor: Color.fromARGB(203, 203, 105, 7),
            ),
            body: Column(
              children: [
                Text(questions.elementAt(questionIndex)),
                ElevatedButton(
                  child: Text(colors[0]),
                  onPressed: answerQuestion,
                  // () {
                  //   print("Another was printed");
                  //   print("Another was printed again");
                  // },
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                ),
                ElevatedButton(
                  child: Text(colors[1]),
                  onPressed: answerQuestion,
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton(
                  child: Text(colors[2]),
                  onPressed: answerQuestion,
                  style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                ),
              ],
            )));
  }
}
