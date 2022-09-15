import 'package:flutter/material.dart';

import './question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < 2) {
      setState(() {
        _questionIndex += 1;
      });
    } else {
      setState(() {
        _questionIndex = 0;
      });
    }
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Blue', 'Yellow']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Cat', 'Fish', 'Horse']
      },
      {
        'questionText': 'What\'s your favorite OS?',
        'answers': ['Windows', 'Linux', 'Mac', 'iOS']
      }
    ];
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
              backgroundColor: Color.fromARGB(203, 203, 105, 7),
            ),
            body: Column(
              children: [
                Question(data[_questionIndex]['questionText']),
                ...(data[_questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(
                      selectHandler: _answerQuestion, answerText: answer);
                })
                // Answer(
                //   btnColor: Colors.blue,
                //   txt: data[_questionIndex]['answers'][0],
                //   selectHandler: _answerQuestion,
                // ),
                // Answer(
                //   btnColor: Colors.red,
                //   txt: "Answer 2",
                //   selectHandler: _answerQuestion,
                // ),
                // Answer(
                //   btnColor: Colors.yellow,
                //   txt: "Answer 3",
                //   selectHandler: _answerQuestion,
                // )
                // Answer(
                //   btnColor: Colors.orange,
                //   txt: "Answer 4",
                //   selectHandler: _answerQuestion,
                // )
                // ElevatedButton(
                //   child: Text(colors[0]),
                //   onPressed: _answerQuestion,
                //   // () {
                //   //   print("Another was printed");
                //   //   print("Another was printed again");
                //   // },
                //   style: TextButton.styleFrom(backgroundColor: Colors.blue),
                // ),
                // ElevatedButton(
                //   child: Text(colors[1]),
                //   onPressed: _answerQuestion,
                //   style: TextButton.styleFrom(backgroundColor: Colors.red),
                // ),
                // ElevatedButton(
                //   child: Text(colors[2]),
                //   onPressed: _answerQuestion,
                //   style: TextButton.styleFrom(
                //       backgroundColor: Colors.yellow,
                //       foregroundColor: Colors.black),
                // ),
              ],
            )));
  }
}
