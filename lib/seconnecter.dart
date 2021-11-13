import 'package:festival/bouton_widget.dart';
import 'package:festival/pageintermediaireuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

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
    return MaterialApp(
      title: titl,
      home: Scaffold(
        appBar: AppBar(
          title: Text(titl),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),

            // !TextRich
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '5000 ', style: TextStyle(color: Colors.white)),
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
                return (value != null && value.contains('@'))
                    ? 'Do not use the @ char.'
                    : null;
              },
            ),
            SizedBox(
              height: 40,
            ),

            // !PasswordField
            PasswordField(
              controller: controllerMDP,
              backgroundColor: Colors.white.withOpacity(0.2),
              hintText: 'Mot de passe',
              inputDecoration: PasswordDecoration(
                inputPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              border: PasswordBorder(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0, color: Colors.grey),
                    borderRadius: BorderRadius.circular(25.7)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            // !ButtonWidget
            ButtonWidget(
              text: 'Envoyer',
              onClicked: () {
               if (controllerId.text == 'user' &&
                    controllerMDP.text == 'user') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pageintermediaireuser()));
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
