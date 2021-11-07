import 'package:flutter/material.dart';
import 'TextfieldBorderWidget.dart';


class Statistiques extends StatefulWidget {
  @override
  _TableExample createState() => _TableExample();
}


class _TableExample extends State<Statistiques> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Tableau"),) ,
      body: DataTable(
        columns: [
          DataColumn(label: Text("Note")),
          DataColumn(label: Text("Année")),
          DataColumn(label: Text("ID")),
        ],
        rows: [
          DataRow(cells: [
          DataCell(Text("1")),
            DataCell(Text("2")),
            DataCell(Text("3")),

      ]),
    ]
    ),
    );
  }
}