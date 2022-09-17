import 'package:flutter/material.dart';

import './question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> data;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.data,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(data[questionIndex]['questionText'] as String),
        // Need the spread operator to combine new lists
        ...(data[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              selectHandler: () => answerQuestion(answer['score'] as int),
              answerText: answer['text'] as String);
        })
      ],
    );
  }
}
