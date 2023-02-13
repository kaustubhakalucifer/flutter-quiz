import 'package:flutter/material.dart';

import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/score.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _questionCounter = 0;
  var _finalScore = 0;

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _questionCounter = 0;
      _finalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _questionCounter += 1;
    _finalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }

  // List of questions to be rendered
  var questions = [
    {
      'questionText': 'What\'s is your favourite color ?',
      'questionOptions': [
        {'option': 'Blue', 'score': 5},
        {'option': 'Black', 'score': 4},
        {'option': 'Green', 'score': 7},
        {'option': 'Red', 'score': 2}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'questionOptions': [
        {'option': 'Lion', 'score': 4},
        {'option': 'Bear', 'score': 5},
        {'option': 'Snake', 'score': 3},
        {'option': 'Deer', 'score': 6}
      ],
    },
    {
      'questionText': 'Favourite character in Dota ?',
      'questionOptions': [
        {'option': 'Huskar', 'score': 4},
        {'option': 'Mirana', 'score': 7},
        {'option': 'Luna', 'score': 5},
        {'option': 'Pudge', 'score': 6}
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz App"),
          backgroundColor: Colors.blueAccent,
        ),
        body: _questionCounter < questions.length
            ? Quiz(questions, _questionIndex, _answerQuestion)
            : Score(_finalScore, resetQuiz),
      ),
    );
  }
}
