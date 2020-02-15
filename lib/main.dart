import 'package:financeiro/app/app.config.dart';
import 'package:financeiro/app/app.dart';
import 'package:financeiro/app/app.theme.dart';
import 'package:financeiro/utils/enums.dart';
import 'package:flutter/material.dart';

void main() {
  var devApp = new AppConfig(
    appName: 'Controle Financeiro',
    environment: EAmbiente.DESENVOLVIMENTO,
    urlBaseApi: 'https://api.eventosgofree.com/v1/api/',
    theme: AppTheme.theme,
    analyticsEnabled: false,
    child: new App(),
  );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(devApp);
}
