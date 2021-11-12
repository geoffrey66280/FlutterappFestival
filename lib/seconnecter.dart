import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class seconnecter extends StatefulWidget {
  const seconnecter({Key? key}) : super(key: key);

  @override
  State<seconnecter> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<seconnecter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text.rich(
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
          const SizedBox(height: 40,),
          PasswordField(
            backgroundColor: Colors.blue.withOpacity(0.2),
            errorMessage: '''
          - A uppercase letter
          - A lowercase letter
          - A digit
          - A special character
          - A minimum length of 8 characters
          ''',
            hintText: 'Default password constraint ',
            inputDecoration: PasswordDecoration(
              inputPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            border: PasswordBorder(
              border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(25.7)),
              focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 0, color: Colors.grey),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 0, color: Colors.grey),
                borderRadius: BorderRadius.circular(25.7),
              ),
            ),
          ),


        ],
      ),
    );

  }
}