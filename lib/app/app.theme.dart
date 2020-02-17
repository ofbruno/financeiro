import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeLight = ThemeData(
    colorScheme: _colorSchemeLight,
    fontFamily: 'Roboto',
    appBarTheme: AppBarTheme(
      color: _colorSchemeLight.onSurface,
      iconTheme: IconThemeData(
        color: _colorSchemeLight.onPrimary,
      ),
      textTheme: TextTheme(
        title: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 21,
          color: _colorSchemeLight.onPrimary,
        ),
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: _colorSchemeLight.surface,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: _colorSchemeLight,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5),
      ),
      buttonColor: _colorSchemeLight.primary,
    ),
    textTheme: TextTheme(
      button: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    ),
    canvasColor: _colorSchemeLight.background,
    cursorColor: _colorSchemeLight.primary,
    toggleableActiveColor: _colorSchemeLight.primary,
    highlightColor: Colors.transparent,
    indicatorColor: _colorSchemeLight.onPrimary,
    primaryColor: _colorSchemeLight.primary,
    accentColor: _colorSchemeLight.primary,
    backgroundColor: _colorSchemeLight.background,
    scaffoldBackgroundColor: _colorSchemeLight.background,
    errorColor: _colorSchemeLight.error,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    typography: Typography(
      platform: defaultTargetPlatform,
      englishLike: Typography.englishLike2018,
      dense: Typography.dense2018,
      tall: Typography.tall2018,
    ),
  );

  static final themeDark = ThemeData(
    colorScheme: _colorSchemeDark,
    appBarTheme: AppBarTheme(
      color: _colorSchemeDark.primary,
      iconTheme: IconThemeData(
        color: _colorSchemeDark.onPrimary,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: _colorSchemeDark.primary,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      colorScheme: _colorSchemeDark,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5),
      ),
    ),
    canvasColor: _colorSchemeDark.background,
    cursorColor: _colorSchemeDark.primary,
    toggleableActiveColor: _colorSchemeDark.primary,
    highlightColor: Colors.transparent,
    indicatorColor: _colorSchemeDark.onPrimary,
    primaryColor: _colorSchemeDark.primary,
    accentColor: _colorSchemeDark.primary,
    backgroundColor: _colorSchemeDark.background,
    scaffoldBackgroundColor: _colorSchemeDark.background,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
    typography: Typography(
      platform: defaultTargetPlatform,
      englishLike: Typography.englishLike2018,
      dense: Typography.dense2018,
      tall: Typography.tall2018,
    ),
  );

  static const _colorSchemeLight = ColorScheme(
    primary: Colors.black,
    primaryVariant: Colors.white,
    secondary: Color(0xFF0f4c75),
    secondaryVariant: Color(0xFFbbe1fa),
    background: Colors.white,
    surface: Colors.white,
    onBackground: Color(0xFF455A64),
    onSurface: Color(0xFF455A64),
    error: Colors.orange,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    brightness: Brightness.light,
  );

  static const _colorSchemeDark = ColorScheme(
    primary: Color(0xFF6200EE),
    primaryVariant: Color(0xFF6200EE),
    secondary: Color(0xFFFF5722),
    secondaryVariant: Color(0xFFFF5722),
    background: Colors.black,
    surface: Colors.black,
    onBackground: Colors.white,
    onSurface: Color(0xFFF2F2F2),
    error: Colors.red,
    onError: Colors.black,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    brightness: Brightness.light,
  );
}
