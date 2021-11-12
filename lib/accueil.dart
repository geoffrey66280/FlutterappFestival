import 'package:festival/seconnecter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("image/logo.jpg"),
            ElevatedButton(
              onPressed:  () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainPage(title: 'Questionnaire'))
                );
              }, child: const Text('Questionnaire'),
            ),
            ElevatedButton(
              onPressed:  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const seconnecter())
                );
              }, child: const Text('Se Connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
