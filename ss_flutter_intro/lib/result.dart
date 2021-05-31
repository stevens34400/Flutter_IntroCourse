import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(
    this.resultScore,
    this.resetHandler,
  );

  String get resultPhrase {
    var resultText;
    if (resultScore <= 2) {
      resultText = "You suck!";
    } else if (resultScore <= 4) {
      resultText = "You're alright";
    } else {
      resultText = "Perfect!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz!'),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
