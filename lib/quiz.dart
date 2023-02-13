import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int _questionIndex;
  final Function (int) _answerQuestion;

  const Quiz(this.questions, this._questionIndex, this._answerQuestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(questions[_questionIndex]['questionText'] as String),
      ...(questions[_questionIndex]['questionOptions'] as List)
          .map((answer) {
        return Answer(() => _answerQuestion(answer['score']), answer['option']);
      }).toList()
    ]);
  }
}
