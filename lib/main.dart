import 'dart:async';

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Yellow', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'rabbit', 'score': 3},
        {'text': 'Horse', 'score': 11},
        {'text': 'Parrot', 'score': 5},
        {'text': 'Dog', 'score': 9}
      ],
    },
    {
      'questionText': 'What\'s your name?',
      'answers': [
        {'text': 'Robert', 'score': 1},
        {'text': 'Kevin', 'score': 1},
        {'text': 'Willian', 'score': 1},
        {'text': 'Peter', 'score': 1}
      ],
    },
  ];

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions.');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
