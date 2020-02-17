import 'package:financeiro/app/app.router.dart';
import 'package:financeiro/ui/splash/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.config.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.black.withOpacity(0.3),
    ));

    // DeviceProvider.iniciar();
    // EndpointsProvider.iniciar(urlApi: AppConfig.of(context).urlBaseApi);
    // AnalyticsProvider.iniciar(habilitado: AppConfig.of(context).analyticsHabilitado);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.of(context).appName,
      theme: AppConfig.of(context).theme,
      darkTheme: AppConfig.of(context).darkTheme,
      home: SplashView(),
      onGenerateRoute: AppRouter.generateRoute,
      //navigatorKey: NavigationProvider.instancia.navigatorKey,
      //navigatorObservers: <NavigatorObserver>[AnalyticsProvider.instancia.analyticsObserver],
    );
  }
}
