import 'package:festival/main.dart';
import 'package:flutter/material.dart';
import 'boutonWidget.dart';

class questionnaire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return questionnaireState();
  }
}

class questionnaireState extends State<questionnaire> {
  //déclaration des variables
  final numberController = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  final GlobalKey<FormFieldState> formFieldKey = GlobalKey();

  int _increment = 0;
  bool isChecked = false; // non pour recommandation
  bool isChecked1 = false; // oui pour recommandation
  bool isChecked2 = false; // oui pour recommandation
  bool isChecked3 = false; // non pour recommandation

  // Widget de la page du questionnaire !!!
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
              hintStyle: TextStyle(color: Colors.red),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),

            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.number,

          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          buildNumber(),
          const SizedBox(height: 0),

          buildText("Recommanderiez vous le festival à vos proches ?"),
          Row(
            children: [
              Checkbox(
                  value: isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                      if (isChecked3 = true) {
                        isChecked3 = false;

                      }
                    });
                  }
              ),
              const Text("Oui",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Checkbox(
                  value: isChecked3,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked3 = value!;
                      if (isChecked2 = true) {
                        isChecked2 = false;

                      }
                    });
                  }
              ),
              const Text("Non",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          SizedBox(height: 40,),
          TextFormField(

            autocorrect: true,
            controller: textController2,
            decoration: InputDecoration(
              labelText: 'Pour quelles raisons ?',
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

            }
          ),


          buildText("Pensez vous revenir l'année suivante ? "),
          Row(
            children: [
              Checkbox(
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value!;
                      if (isChecked = true) {
                        isChecked = false;

                      }
                    });
                  }
              ),
              const Text("Oui",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      if (isChecked1 = true) {
                        isChecked1 = false;

                      }
                    });
                  }
              ),
              const Text("Non",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          SizedBox(height:30,), // Espace entre les widgets

          // Bouton envoyer
          ButtonWidget(
            text: 'Envoyer' ,
            onClicked: () {
              String raison = textController2.text;
              int note = int.parse(numberController.text);
              if (note <= 0 || note >= 10) {
                // Suppression des champs de textes
                numberController.clear();
                print('veuillez ressaisir une note entre 1 et 10');
              }else {
                


                // Quand cliquer sur le bouton alors envoyer les données
                print('La note du festival est : ${numberController.text}');
                print('raisons : ${textController2.text}');

                // incrémenter le nbFormulaire
                setState(() {
                  print('Numéro du formulaire : ${_increment++}');
                });

                // suppresion après envoi
                numberController.clear();
                textController2.clear();
                textController3.clear();
                isChecked2 = false;
                isChecked3 = false;
                isChecked1 = false;
                isChecked = false;
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
              textController2.clear();
              textController3.clear();
              setState(() {
              isChecked2 = false;
              isChecked3 = false;
              isChecked1 = false;
              isChecked = false;
              });
            },
          ),

          // nbFormulaire envoyé pas fonctionnel !!!
          buildText("Nombre de formlulaire envoyé : ${_increment}")
        ],
      ),
    );
  }
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








