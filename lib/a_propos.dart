import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);
  static const String _title = "A propos de l'application";

  @override
  Widget build(BuildContext context) {
    String titl = 'A Propos';
    return MaterialApp(
        title: titl,
        home: Scaffold(
        appBar: AppBar(
        title: Text(titl),
    ),
    body: ListView(
    children: <Widget>[


      ],
    ),
    ),
    );
  }
}