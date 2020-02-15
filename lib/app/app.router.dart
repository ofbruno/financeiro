import 'package:financeiro/ui/home/home.view.dart';
import 'package:financeiro/ui/login/login.view.dart';
import 'package:financeiro/ui/splash/splash.view.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String loginComEmail = '/login/email';
  static const String loginRecuperarSenha = '/login/recuperar-senha';
  static const String perfil = '/perfil';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //SPLASH
      case AppRouter.splash:
        return CupertinoPageRoute(
          builder: (_) => SplashView(),
          fullscreenDialog: true,
        );

      //HOME
      case AppRouter.home:
        return CupertinoPageRoute(
          builder: (_) => HomeView(),
        );

      //LOGIN
      case AppRouter.login:
        return CupertinoPageRoute(
          builder: (_) => LoginView(),
        );

      //DEFAULT
      default:
        return CupertinoPageRoute(
          builder: (_) => LoginView(),
        );
    }
  }

  static Widget pageFromRoute(String routeName) {
    switch (routeName) {
      case AppRouter.login:
        return LoginView();
      case AppRouter.home:
        return HomeView();
    }

    return null;
  }
}
