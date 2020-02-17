import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final themeLight = ThemeData(
    colorScheme: _colorSchemeLight,
    appBarTheme: AppBarTheme(
      color: _colorSchemeLight.primary,
      iconTheme: IconThemeData(
        color: _colorSchemeLight.onPrimary,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: _colorSchemeLight.primary,
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
    primary: Color(0xFF075E54),
    primaryVariant: Color(0xFF128C7E),
    secondary: Color(0xFFFF5722),
    secondaryVariant: Color(0xFFFF5722),
    background: Colors.white,
    surface: Color(0xFFECE5DD),
    onBackground: Color(0xFF455A64),
    onSurface: Color(0xFF455A64),
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
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
