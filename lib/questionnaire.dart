import 'main.dart';
import 'utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'a_propos.dart';
import 'methodes.dart';
import 'bouton_widget.dart';
import 'login.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool retouroupas = false;
  String def = "";
  String dropdownValue = 'Toulouse';
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

  get labels => ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  Widget buildToggle() => CupertinoSwitch(
        value: retouroupas,
        onChanged: (value) => setState(() => retouroupas = value),
      );
  @override
  Widget build(BuildContext context) {
    String titl = 'Questionnaire';
    final labels = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
    final double min = 0;
    final double max = 10;
    final divisions = labels.length;

    return Scaffold(
      appBar: AppBar(
        title: Text("Questionnaire"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Apropos()));
                },
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          buildNumber(),

          const SizedBox(height: 0),
          Center(
            child: buildText('note du festival'),
          ),

          getList(),
          getSlide(),

          buildText("Recommanderiez vous le festival à vos proches ?"),
          Row(
            children: [

            ],
          ),

          SizedBox(
            height: 40,
          ),
          methodes.getEcrire('ouiii',textController2),
          SizedBox(
            height: 30,
          ),

          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: builddrop(context),
              ),
            ],
          )),

          SizedBox(
            height: 30,
          ), // Espace entre les widgets

          // Bouton envoyer
          ButtonWidget(
            text: 'Envoyer',
            onClicked: () async {
              logine.post();
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Formulaire envoyé')));

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
          buildText("Nombre de formulaire envoyé : ${_increment}")
        ],
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

  Widget builddrop(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Toulouse', 'Blagnac', 'Pibrac', 'Montaudran']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],

    );
  }

  Container getList() {
    return Container(
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
    );
  }

  Slider getSlide() {
    return Slider(
      value: indexTop.toDouble(),
      min: 0,
      max: 10,
      divisions: 10,
      activeColor: Colors.blue,
      label: labels[indexTop],
      onChanged: (_value) => setState(() => this.indexTop = _value.toInt()),
    );
  }
}
