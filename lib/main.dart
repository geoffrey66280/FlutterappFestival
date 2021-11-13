import 'package:festival/accueil.dart';
import 'package:festival/seconnecter.dart';
import 'package:festival/test.dart';
import 'package:festival/test1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'statistiques.dart';
import 'questionnaire.dart';
import 'a_propos.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Accueil';

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: MainPage(title: title), // submit button
  );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(

    body: buildPages(),

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: Colors.purple,
      items: const [
        BottomNavigationBarItem(
          icon: Text('Accueil'),
          title: Text('Festival')

        ),

        BottomNavigationBarItem(
          icon: Text('Questionnaire'),
          title: Text('Festival')
        ),
        /*
        BottomNavigationBarItem(
            icon: Text('Test'),
            title: Text('Festival')
        ),
*/
        BottomNavigationBarItem(
            icon: Text('Se connecter'),
            title: Text('Festival')
        ),
        BottomNavigationBarItem(
            icon: Text('A propos'),
            title: Text('Festival')
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    ),
  );


  Widget buildPages() {
    switch (index) {
      case 0:
        return Accueil();
      case 1:
        return questionnaire();
        /*
      case 3:
        return const test();
        */

      case 2:
        return const seconnecter();
      case 3:
        return const Apropos();
      default:
       return Container();

    }
  }
}


