import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);
  static const String _title = "A propos de l'application";

  @override
  Widget build(BuildContext context) {
    String titl = 'A Propos';
    return Scaffold(
        appBar: AppBar(
        title: Text(titl),
    ),
    body: ListView(
    children: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 20.0),
          ),
      const SizedBox(height: 50),
        Text('Les informations du questionnaire ne seront pas des infomations sensibles (nom, prénom, âge, etc..): les réponses seront sous format anonyme',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),

      ],
    ),

    );
  }
}