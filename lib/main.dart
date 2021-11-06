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
    theme: ThemeData(primaryColor: Colors.green),
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
      selectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Text('Questionnaire'),

        ),
        BottomNavigationBarItem(
          icon: Text('Statistiques'),

        ),
        BottomNavigationBarItem(
          icon: Text('A propos'),
      
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