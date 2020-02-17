import 'package:financeiro/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required Widget child,
    @required this.appName,
    @required this.environment,
    @required this.urlBaseApi,
    @required this.theme,
    @required this.darkTheme,
    @required this.analyticsEnabled,
  }) : super(child: child);

  final String appName;
  final EAmbiente environment;
  final String urlBaseApi;
  final ThemeData theme;
  final ThemeData darkTheme;
  final bool analyticsEnabled;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
