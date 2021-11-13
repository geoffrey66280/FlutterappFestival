import 'package:festival/questionnaire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'a_propos.dart';

/**?
 * ? Classe pageintermediaire: page après connexion
 * ? pageintermediaire Constante: clé
   ? */
class pageintermediaireuser extends StatelessWidget {
  const pageintermediaireuser({Key? key}) : super(key: key);

  /**+
   * + home Scaffold: Affiche le titre de la page
   * + body Center: Affichage des widgets au centre
   * + ElevatedButton: bouton A propos qui redirige vers la page A propos
   * + ElevatedButton: bouton se connecter pour arriver sur la page de login
   * + @return MaterialApp
      +*/
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

            // !ElevatedButton
              ElevatedButton(
                onPressed:  () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Apropos())
                  );
                }, child: const Text('A propos'),
              ),

              SizedBox(height: 100,),

              // !ElevatedButton
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
