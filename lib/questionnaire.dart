import 'package:flutter/material.dart';
import 'boutonWidget.dart';

class questionnaire extends StatelessWidget {

  // declaration variables
  final numberController = TextEditingController();
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  int _increment = 0;

  @override
  Widget build(BuildContext context) =>
      // Widget de la page du questionnaire !!!
      Center(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            buildNumber(),
            const SizedBox(height: 0),

            // début d'implémentation des textes

            buildText('Recommanderiez vous ce festival à vos proches ?'),
            TextField(
              controller: textController1,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
              ),
            ),

            buildText('Et pour quelles raison? '),
            TextField(
              controller: textController2,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
              ),
            ),

            buildText("Pensez vous revenir l'année suivante ? "),
            TextField(
              controller: textController3,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 3),

                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),

                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
              ),
            ),

            SizedBox(height:30,), // Espace entre les widgets

            // Bouton envoyer
            ButtonWidget(
              text: 'Envoyer' ,
              onClicked: () {

              int note = int.parse(numberController.text);
              if (note >= 0 && note <= 10) {
                // Quand cliquer sur le bouton alors envoyer les données
                print('La note du festival est : ${numberController.text}');
                print('Recommandation : ${textController1.text}');
                print('raisons : ${textController2.text}');
                print('Présence année suivante : ${textController3.text}');


                // incrémenter le nbFormulaire
                _increment ++;
                print('Numéro du formulaire : ${_increment}');
                numberController.clear();
                textController1.clear();
                textController2.clear();
                textController3.clear();
              } else {
                // Suppression des champs de textes
                numberController.clear();
                print('veuillez ressaisir une note entre 1 et 10');
                //ajouter texte sur appli
              }
                },
            ),


            SizedBox(height: 30,), // espace

            // Bouton Annuler
            ButtonWidgete(
              text: 'Annuler' ,
              onClicked: () {
                // Quand cliquer sur annuler => supprimer les champs
                numberController.clear();
                textController1.clear();
                textController2.clear();
                textController3.clear();
              },
            ),

                // nbFormulaire envoyé pas fonctionnel !!!
                buildText("Nombre de formlulaire envoyé : ${_increment}")
          ],
        ),
      );

  Widget buildText(String text) =>
      Container(
        margin: EdgeInsets.fromLTRB(0, 24, 0, 8),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), //Police
        ),
      );

  // Widget de la note du festival (nombre)
  Widget buildNumber() =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText('Note du festival'),
          const SizedBox(height: 6),
          TextField(
            controller: numberController,

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.black, width: 3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.green, width: 3),
              ),
              hintText: '1 à 10',
              hintStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,
          ),
        ],
      );

}


/*
class nextPage extends StatefulWidget {
  late String value;

  @override
  _nextPageState createState() => new _nextPageState();
}
class _nextPageState extends State<nextPage> {
  @override
  Widget build(BuildContext context) {
  return new Scaffold(
    appBar new AppBar(
      title: new Text("next page"),
    ),
    body: new Text("${widget.value}"),
  ),

}
}
*/




