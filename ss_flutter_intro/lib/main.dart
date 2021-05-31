import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
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
  }

  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 1},
          {'text': 'Blue', 'score': 2},
          {'text': 'Yellow', 'score': 3},
          {'text': 'White', 'score': 4},
        ],
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Dog', 'score': 1},
          {'text': 'Cat', 'score': 2},
          {'text': 'Rabbit', 'score': 3},
          {'text': 'Bird', 'score': 4},
        ],
      },
      {
        'questionText': 'What\'s your gender?',
        'answers': [
          {'text': 'Female', 'score': 1},
          {'text': 'Male', 'score': 1},
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
