import 'package:flutter/material.dart';


class Statistiques extends StatefulWidget {
  const Statistiques({Key? key}) : super(key: key);

  @override
  _TableExample createState() => _TableExample();
}
class _TableExample extends State<Statistiques> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text("Tableau"),) ,
      body: DataTable(
        columns: const [
          DataColumn(label: Text("Note")),
          DataColumn(label: Text("Année")),
          DataColumn(label: Text("ID")),
        ],
        rows: const [
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