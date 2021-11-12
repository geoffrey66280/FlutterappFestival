import 'package:festival/acceuil.dart';
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
  static const String title = 'Application Festival';

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
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: buildPages(),

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: Colors.purple,
      items: const [
        BottomNavigationBarItem(
          icon: Text('Questionnaire'),
          title: Text('Festival')

        ),
        BottomNavigationBarItem(
          icon: Text('Statistiques'),
            title: Text('Festival')
        ),
        BottomNavigationBarItem(
          icon: Text('A propos'),
          title: Text('Festival')
        ),
        BottomNavigationBarItem(
            icon: Text('Test'),
            title: Text('Festival')
        ),
        BottomNavigationBarItem(
            icon: Text('Test1'),
            title: Text('Festival')
        ),
        BottomNavigationBarItem(
            icon: Text('Acceuil'),
            title: Text('Festival')
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    ),
  );


  Widget buildPages() {
    switch (index) {
      case 0:
        return questionnaire();
      case 1:
        return const Statistiques();
      case 2:
        return const Apropos();
      case 3:
        return const test();
      case 4:
        return const test1();
      case 5:
        return const Accueil();
      default:
       return Container();

    }
  }
}


