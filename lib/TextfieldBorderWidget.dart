import 'package:flutter/material.dart';

import 'ButtonWidget.dart';


class TextfieldBorderWidget extends StatelessWidget {

  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [


            buildNumber(),
            const SizedBox(height: 24),






            buildText('Recommanderiez vous ce festival à vos proches ?'),
            TextField(
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


            ButtonWidget(
              text: 'Envoyer',
              onClicked: () {
                print('Number: ${numberController.text}');
                numberController.clear();

              },
            ),

          ],
        ),
      );

  Widget buildText(String text) =>
      Container(
        margin: EdgeInsets.fromLTRB(0, 24, 0, 8),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      );

  Widget buildNumber() =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Note du festival', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: numberController,
            decoration: InputDecoration(
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




