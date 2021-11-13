import 'package:festival/modifierquestion.dart';
import 'package:festival/questionnaire.dart';
import 'package:festival/seconnecter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'a_propos.dart';
import 'main.dart';

class pageintermediaireuser extends StatelessWidget {
  const pageintermediaireuser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titl = 'Mékanik du rire';
    return MaterialApp(
      title: titl,
      home: Scaffold(
        appBar: AppBar(
          title: Text(titl),
        ),
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




              SizedBox(height: 100,),
              ElevatedButton(
                onPressed:  () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => questionnaire())
                  );
                },
                child: const Text('Questionnaire'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: const Size(300, 75),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),

              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
