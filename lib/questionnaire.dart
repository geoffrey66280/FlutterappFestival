import 'package:festival/main.dart';
import 'package:festival/utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'bouton_widget.dart';

class questionnaire extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return questionnaireState();
  }
}
/** ?
 * ? Classe questionnaire qui définit la page pour remplire le questionnaire
 ? */

class questionnaireState extends State<questionnaire> {
  //déclaration des variables
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  double _value = 0.5;
  int _increment = 0;
  bool isChecked = false; // non pour recommandation
  bool isChecked1 = false; // oui pour recommandation
  bool isChecked2 = false; // oui pour année suivante
  bool isChecked3 = false; // non pour année suivante

  // Widget de la page du questionnaire !!!

  int index = 0;

  // Widget de la note du festival (nombre)
  int indexTop = 0;

  @override
  Widget build(BuildContext context) {
    String titl = 'Questionnaire';
    final labels = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
    final double min = 0;
    final double max = 10;
    final divisions = labels.length;
    return MaterialApp(
      title: titl,
      home: Scaffold(
        appBar: AppBar(
          title: Text(titl),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            buildNumber(),
            const SizedBox(height: 0),
            Center(
              child: buildText('Note du festival'),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: Utils.modelBuilder(
                    labels,
                    (index, label) {
                      final selectedColor = Colors.black;
                      final unselectedColor = Colors.black.withOpacity(0.3);
                      final isSelected = index <= indexTop;
                      final color = isSelected ? selectedColor : unselectedColor;

                      return buildLabel(label: labels[index], color: color);
                    },
                  )),
            ),

            Slider(
              value: indexTop.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              activeColor: Colors.blue,
              label: labels[indexTop],
              onChanged: (_value) =>
                  setState(() => this.indexTop = _value.toInt()),
            ),

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
                    }),
                const Text(
                  "Oui",
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
                    }),
                const Text(
                  "Non",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),
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
                }),

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
                    }),
                const Text(
                  "Oui",
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
                    }),
                const Text(
                  "Non",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ), // Espace entre les widgets

            // Bouton envoyer
            ButtonWidget(
              text: 'Envoyer',
              onClicked: () {
                String raison = textController2.text;
                // Quand cliquer sur le bouton alors envoyer les données
                print('La note du festival est : ${indexTop}');
                print('raisons : ${textController2.text}');
                // incrémenter le nbFormulaire
                setState(() {
                  print('Numéro du formulaire : ${_increment++}');
                });

                // suppresion après envoi
                textController2.clear();
                isChecked2 = false;
                isChecked3 = false;
                isChecked1 = false;
                isChecked = false;
              },
            ),

            SizedBox(
              height: 30,
            ), // espace

            // Bouton Annuler
            ButtonWidgete(
              text: 'Annuler',
              onClicked: () {
                // Quand cliquer sur annuler => supprimer les champs
                textController2.clear();
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
      ),
    );
  }

  Widget buildLabel({
    required String label,
    required Color color,
  }) =>
      Container(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );

  Widget buildNumber() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),
        ],
      );

  Widget buildSideLabel(double value) => Container(
        width: 25,
        child: Text(
          value.round().toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );

  Widget buildText(String text) => Container(
        margin: EdgeInsets.fromLTRB(0, 24, 0, 8),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24), //Police
        ),
      );
}
