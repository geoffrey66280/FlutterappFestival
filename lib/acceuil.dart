import 'package:festival/questionnaire.dart';
import 'package:festival/seconnecter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'a_propos.dart';
import 'main.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            ElevatedButton(
              onPressed:  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Apropos())
                );
              }, child: const Text('A propos'),
            ),

            Image.asset("image/logo.jpg"),

            ElevatedButton(
              onPressed:  () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => questionnaire())
                );
              },
              child: const Text('Questionnaire'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  fixedSize: const Size(150, 75),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed:  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const seconnecter())
                );
              },
              child: const Text('Se Connecter'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  fixedSize: const Size(150, 75),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
    );
  }
}
