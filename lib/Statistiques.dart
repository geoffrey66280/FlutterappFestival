import 'package:flutter/material.dart';
import 'TextfieldBorderWidget.dart';

class Statistiques extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}

class _TableExample extends State<Statistiques> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Table Example'),
          ),
          body: Center(
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                    children: [
                      TableRow( children: [
                        Column(children:[Text('Recommandation', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('Année suivante', style: TextStyle(fontSize: 20.0))]),
                        Column(children:[Text('Review', style: TextStyle(fontSize: 20.0))]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('oui')]),
                        Column(children:[Text('non')]),
                        Column(children:[Text('numberController')]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('Javatpoint')]),
                        Column(children:[Text('MySQL')]),
                        Column(children:[Text('5*')]),
                      ]),
                      TableRow( children: [
                        Column(children:[Text('Javatpoint')]),
                        Column(children:[Text('ReactJS')]),
                        Column(children:[Text('5*')]),
                      ]),
                    ],
                  ),
                ),
              ])
          )),
    );
  }
}