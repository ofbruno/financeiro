import 'package:flutter/material.dart';

class AppTheme {
  static Map<int, Color> primarySwatchColors = {
    50: Color.fromRGBO(67, 51, 119, .1),
    100: Color.fromRGBO(67, 51, 119, .2),
    200: Color.fromRGBO(67, 51, 119, .3),
    300: Color.fromRGBO(67, 51, 119, .4),
    400: Color.fromRGBO(67, 51, 119, .5),
    500: Color.fromRGBO(67, 51, 119, .6),
    600: Color.fromRGBO(67, 51, 119, .7),
    700: Color.fromRGBO(67, 51, 119, .8),
    800: Color.fromRGBO(67, 51, 119, .9),
    900: Color.fromRGBO(67, 51, 119, 1),
  };

  static final theme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: MaterialColor(0xFF433377, primarySwatchColors),
    primaryIconTheme: IconThemeData(color: Colors.white),
    accentColor: Color.fromRGBO(113, 121, 84, 1),
    backgroundColor: Color.fromRGBO(236, 240, 227, 1),
    fontFamily: 'OpenSans',
    textTheme: TextTheme(
      title: TextStyle(
        color: primarySwatchColors[400],
      ),
      button: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
