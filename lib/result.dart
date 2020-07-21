import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function restartQuiz;

  Result(this.totalScore, this.restartQuiz);

  String get resultPhrase {
    var resultText = 'You did it';
    if (totalScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (totalScore <= 16) {
      resultText = 'You are strange....';
    } else {
      resultText = 'You are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!!!'),
            textColor: Colors.blue,
            onPressed: restartQuiz,
          )
        ],
      ),
    );
  }
}
