import 'package:flutter/material.dart';

class methodes extends StatefulWidget{

  static TextFormField getEcrire(String texteQ, TextEditingController textC) {
    return TextFormField(
        autocorrect: true,
        controller: textC,
        decoration: InputDecoration(
          labelText: texteQ,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.black, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.green, width: 3),
          ),
        ),
        validator: (String? value) {
          if (value == null) {
            return 'Veuillez saisir du texte';
          }
        });
  }



  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}