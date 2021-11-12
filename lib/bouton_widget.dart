import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Bouton valider
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  // Constructeur
  const ButtonWidget({
    required this.text,
    required this.onClicked, floatingActionButton,
  }) ;

  @override
  Widget build(BuildContext context) => RaisedButton(
    child: Text(
      text,
      style: const TextStyle(fontSize: 24),
    ),
    shape: const StadiumBorder(),
    color: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textColor: Colors.white,
    onPressed: onClicked,

  );
}

// Bouton Annuler
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
      style: const TextStyle(fontSize: 24),
    ),
    shape: const StadiumBorder(),
    color: Colors.red,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textColor: Colors.white,
    onPressed: onClicked,

  );
}

class ButtonQuest extends StatelessWidget {
  const ButtonQuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//Bouton Questionnaire
class ButtonQuestionnaire extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  // Constructeur
  const ButtonQuestionnaire({
    required this.text,
    required this.onClicked, floatingActionButton,
  }) ;

  @override
  Widget build(BuildContext context) => RaisedButton(
    child: Text(
      text,
      style: const TextStyle(fontSize: 24),
    ),
    shape: const StadiumBorder(),
    color: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textColor: Colors.white,
    onPressed: onClicked,

  );
}