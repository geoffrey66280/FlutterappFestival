import 'dart:convert';

import 'login.dart';
import 'seconnecter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'a_propos.dart';
import 'main.dart';

/**? Classe Accueil qui affiche la première page de l'application
 * ? Accueil Constante avec une clé
 * ? @override Widget build
 * ? Extends de StatelessWidget
   ?*/
class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  /**+
   * + home Scaffold: Affiche le titre de la page
   * + body Center: Affichage des widgets au centre
   * + ElevatedButton: bouton A propos qui redirige vers la page A propos
   * + CircleAvatar: Permet d'afficher l'image en cercle avec un radius
   * + ElevatedButton: bouton se connecter pour arriver sur la page de login
   * + @return MaterialApp
     +*/
  @override
  Widget build(BuildContext context) {
    String titl = 'Accueil';
    bool _bool = false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        actions: [
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),

            SizedBox(
              height: 60,
            ),
            // !CircleAvatar
            AnimatedPhysicalModel(
              shape: BoxShape.rectangle,
              elevation: _bool ? 0 : 15,
              color: Colors.white,
              shadowColor: Colors.black,
              duration: const Duration(milliseconds: 600),
              child: SizedBox(
                  height: 160,
                  width: 250,
                  child: Image.asset("image/actenrue.png")),
            ),
            SizedBox(
              height: 20,
            ),

            // !ElevatedButton
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const seconnecter()));
                int indiceOuvrant = 0;
                int indiceFermant;
                var donnee;
                List tab;
                List numero = [];
                List max = [];
                List min = [];
                List listeReponse = [];
                List type = [];
                List evenement = [];
                List libelle= [];

                logine.geti('http://193.54.227.216/getQuestionnaire.php').then((value) => {


                  for (int i = 0; i < value.length; i++) {

                    if (value[i] == '[') {
                      indiceOuvrant = i,
                    },

                    if (value[i] == ']') {
                      indiceFermant = i,
                      donnee = value.substring(indiceOuvrant, indiceFermant + 1),

                      tab = donnee.split(";"),
                      evenement.add(tab[0]),
                      numero.add(tab[1]),
                      libelle.add(tab[2]),
                      type.add(tab[3]),
                      min.add(tab[4]),
                      max.add(tab[5]),
                      listeReponse.add(tab[6]),

                    },
                  },
                  print(evenement),
                  print(numero),
                  print(libelle),
                  print(type),
                  print(min),
                  print(max),
                  print(listeReponse)
                });
              },
              child: const Text('Se Connecter'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ],
        ),
      ),
    );
  }
}
