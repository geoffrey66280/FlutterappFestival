
import 'package:flutter/material.dart';


class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);
  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;

    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,

  );
}