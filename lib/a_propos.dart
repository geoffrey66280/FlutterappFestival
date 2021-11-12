import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
      ),
    );
  }
}