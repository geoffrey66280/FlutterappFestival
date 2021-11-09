import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Statistiques.dart';
import 'TextfieldBorderWidget.dart';
import 'TextfieldGenerateWidget.dart';

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
  Widget build(BuildContext context) => MaterialApp(
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
  int _counter = 0;
  void _incrementer() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: buildPages(),

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: Colors.purple,
      items: [
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
      ],
      onTap: (int index) => setState(() => this.index = index),
    ),
  );


  Widget buildPages() {
    switch (index) {
      case 0:
        return TextfieldBorderWidget();
      case 1:
        return Statistiques();


      default:
       return Container();

    }
  }
}


