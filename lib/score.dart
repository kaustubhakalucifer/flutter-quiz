import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  const Score(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (totalScore <= 5) {
      resultText = 'Less : $totalScore';
    } else if (totalScore > 5 && totalScore <= 10) {
      resultText = 'Average : $totalScore';
    } else {
      resultText = 'Good : $totalScore';
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
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: resetQuiz,
            child: const Text('Restart quiz!',
            ),
          )
        ],
      )
    );
  }
}
