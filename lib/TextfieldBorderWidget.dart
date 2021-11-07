import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'ButtonWidget.dart';
import 'Statistiques.dart';


class TextfieldBorderWidget extends StatelessWidget {

  final numberController = TextEditingController();
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();

  get checkBoxValue => null;


  @override
  Widget build(BuildContext context) =>
      Center(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [


            buildNumber(),
            const SizedBox(height: 0),






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






          
          


            SizedBox(height:30,),

            ButtonWidget(
              text: 'Envoyer',
              onClicked: () {
                print('Number: ${numberController.text}');
                print('texte 1: ${textController1.text}');
                print('texte 2: ${textController2.text}');
                print('texte 3: ${textController3.text}');


                numberController.clear();
                textController1.clear();
                textController2.clear();
                textController3.clear();

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
/* Checkbox
Widget build(BuildContext context) {
  return CheckboxListTile(
    title: const Text('Animate Slowly'),
    value: timeDilation != 1.0,
    onChanged: (bool? value) {

    },
  );

}

*/



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







class GetCheckValue extends StatefulWidget {
  @override
  GetCheckValueState createState() {
    return new GetCheckValueState();
  }
}

class GetCheckValueState extends State<GetCheckValue> {
  bool _isChecked = true;
  String _currText = '';

  List<String> text = ["InduceSmile.com", "Flutter.io", "google.com"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get check Value Example"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(_currText,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Expanded(
              child: Container(
                height: 350.0,
                child: Column(
                  children: text
                      .map((t) => CheckboxListTile(
                    title: Text(t),
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val!;
                        if (val == true) {
                          _currText = t;
                        }
                      });
                    },
                  ))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}



