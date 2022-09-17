import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  // Getter Function
  String get resultPhrase {
    var resultText;
    if (resultScore <= 8)
      resultText = 'You are awesome and innocent!';
    else if (resultScore <= 12)
      resultText = 'Pretty likeable!';
    else if (resultScore <= 16)
      resultText = 'You are ... strange?!';
    else
      resultText = 'You are so bad!';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                resultPhrase,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Score: ' + resultScore.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(onPressed: resetHandler, child: Text('Restart Quiz'))
            ]));
  }
}
