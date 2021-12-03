import 'dart:convert';

import 'login.dart';
import 'questionnaire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'a_propos.dart';
import 'package:http/http.dart' as http;
/**?
 * ? Classe seconnecter: page de connexion de l'utilisateur
   ?*/
class seconnecter extends StatefulWidget {
  const seconnecter({Key? key}) : super(key: key);

  // -Override: créer un état de la classe se connecter qui devient l'état de MyStatefulWidgetState
  @override
  State<seconnecter> createState() => _MyStatefulWidgetState();
}

/**?
 * ? Classe _MyStatefulWidgetState: page de connexion de l'utilisateur
 * ? extends de l'état de la classe seconnecter
 * ? titl: Titre de la page
 * ? controllerId: texte saisie par l'utilisateur sur la zone identifiant du Widget TextFormField
 * ? controllerMDP: texte saisie par l'utilisateur sur la zone Mot de passe du Widget passWordField
   ? */
class _MyStatefulWidgetState extends State<seconnecter> {
  String titl = 'Se Connecter';
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerMDP = TextEditingController();

  /**+
   * + home Scaffold: Affiche le titre de la page
   * + body ListView: Affichage des widgets sur la vue de l'app
   * + TextFormField: affiche la boite de saisie de l'identifiant utilisateur
   * +passWordField: affiche la boite de saisie du mot de passe de l'utilisateur
   * + ButtonWidget seconnecter: bouton qui permet à l'utilisateur de se connecter (conditions si mauvais identifiants)
   * + @return MaterialApp
      +*/
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(

        appBar: AppBar(
          title: Text("Page de connexion"),

          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Apropos())
                  );},
                  child: Icon(
                      Icons.more_vert

                  ),
                )
            ),
          ],
        ),
          body: Padding(
            padding: const EdgeInsets.all(70.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),

                // !TextRich
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[

                      TextSpan(
                          text: 'Page de connexion',
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontFamily: 'Karla'),
                ),
                SizedBox(
                  height: 40,
                ),

                // !TextFormField
                TextFormField(
                  controller: controllerId,
                  autofocus: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Veuillez saisir votre identifiant',
                    labelText: 'Identifiant',
                  ),
                  onSaved: (String? value) {

                  },

                ),
                SizedBox(
                  height: 40,
                ),

                // !PasswordField
                TextFormField(
                  controller: controllerMDP,
                  obscureText: true,
                    onEditingComplete: () =>
                        FocusScope.of(context).nextFocus(),
                  decoration: const InputDecoration(
                    icon: Icon(Icons.enhanced_encryption),
                    hintText: 'Veuillez saisir votre Mot de passe',
                    labelText: 'Mot de passe',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                  },
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                SizedBox(
                  height: 80,
                ),

                // !ButtonWidget
                ElevatedButton(

                  onPressed: () {
logine.connexion();
                   if (controllerId.text == 'user' &&
                        controllerMDP.text == 'user') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => questionnaire()));
                    } else {
                      controllerId.clear();
                      controllerMDP.clear();
                    }
                  },
                  child: const Text('Se connecter'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      fixedSize: const Size(150, 75),
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ],
            ),
          ),
        ),
    );

  }

}


