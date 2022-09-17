import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _data = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'Dog', 'score': 3},
        {'text': 'Hamster', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite OS?',
      'answers': [
        {'text': 'iOS', 'score': 10},
        {'text': 'Windows', 'score': 5},
        {'text': 'Mac', 'score': 3},
        {'text': 'Linux', 'score': 1}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My First App'),
              // backgroundColor: Color.fromARGB(201, 7, 125, 203),
            ),
            body: _questionIndex < _data.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    data: _data,
                    questionIndex: _questionIndex,
                  )
                : Result(_totalScore, _resetQuiz)));
  }
}
