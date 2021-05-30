import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;

  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      child: RaisedButton(
        child: Text('Answer 1'),
        color: Colors.blue,
        onPressed: selectHandler,
      ),
    );
  }
}
