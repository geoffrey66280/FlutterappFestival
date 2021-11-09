import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;


  const ButtonWidget({
    required this.text,
    required this.onClicked, floatingActionButton,



  }) ;

  @override
  Widget build(BuildContext context) => RaisedButton(
    child: Text(
      text,
      style: TextStyle(fontSize: 24),
    ),
    shape: StadiumBorder(),
    color: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textColor: Colors.white,
    onPressed: onClicked,

  );
}

class ButtonWidgete extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;


  const ButtonWidgete({
    required this.text,
    required this.onClicked, floatingActionButton,



  }) ;

  @override
  Widget build(BuildContext context) => RaisedButton(
    child: Text(
      text,
      style: TextStyle(fontSize: 24),
    ),
    shape: StadiumBorder(),
    color: Colors.red,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textColor: Colors.white,
    onPressed: onClicked,

  );
}
