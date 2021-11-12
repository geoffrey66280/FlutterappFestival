import 'package:festival/bouton_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class seConnecter extends StatefulWidget {
  const seConnecter({Key? key}) : super(key: key);

  @override
  State<seConnecter> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<seConnecter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '5000 ', style: TextStyle(color: Colors.white)),
                  TextSpan(text: 'Page de connexion', style: TextStyle(color: Colors.blue)),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Karla'
              ),
            ),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Veuillez saisir votre identifiant',
            labelText: 'Identifiant',
          ),
          onSaved: (String? value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: (String? value) {
            return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
          },
        ),

    ],
    ),

    );

  }
}