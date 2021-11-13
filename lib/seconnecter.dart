import 'package:festival/bouton_widget.dart';
import 'package:festival/pageintermediaireadmin.dart';
import 'package:festival/pageintermediaireuser.dart';
import 'package:festival/questionnaire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class seconnecter extends StatefulWidget {
  const seconnecter({Key? key}) : super(key: key);

  @override
  State<seconnecter> createState() => _MyStatefulWidgetState();
}
class _MyStatefulWidgetState extends State<seconnecter> {
  String titl = 'Se Connecter';
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerMDP = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titl,

          home: Scaffold(
          appBar: AppBar(
          title: Text(titl),
    ),
            body: ListView(
              children: <Widget>[
          SizedBox(height: 40,),
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
                SizedBox(height: 40,),
        TextFormField(
          controller: controllerId,
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
            SizedBox(height: 40,),
    PasswordField(
      controller: controllerMDP,
    backgroundColor: Colors.white.withOpacity(0.2),
    hintText: 'Mot de passe',
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
                SizedBox(height: 50,),

                ButtonWidget(
                  text: 'Envoyer',
                  onClicked: () {
      if (controllerId.text == 'admin' && controllerMDP.text == 'admin') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => pageintermediaireadmin()));

    } else if (controllerId.text == 'user' && controllerMDP.text == 'user'){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => pageintermediaireuser())
        );
                    } else {
                       controllerId.clear();
                       controllerMDP.clear();

                    }
                  },
                ),
              ],
            ),
           ),
         );
      }
  }