import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 8},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'Who is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Penguin', 'score': 1},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 10}
      ]
    },
    {
      'questionText': 'What is your fav food?',
      'answers': [
        {'text': 'North Indian', 'score': 1},
        {'text': 'South Indian', 'score': 2},
        {'text': 'Italian', 'score': 3},
        {'text': 'Chinese', 'score': 4}
      ]
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
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
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
