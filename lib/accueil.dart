import 'package:festival/questionnaire.dart';
import 'package:festival/seconnecter.dart';
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
    return MaterialApp(
      title: titl,
      home: Scaffold(
        appBar: AppBar(
          title: Text(titl),
        ),
        body: Center(
          child: Column(
            children: [
              // !ElevatedButton
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Apropos()));
                },
                child: const Text('A propos'),
              ),

              // !CircleAvatar
              CircleAvatar(
                radius: 100,
                child: Image.asset("image/logo.jpg"),
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
      ),
    );
  }
}
