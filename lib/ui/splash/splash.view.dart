import 'package:financeiro/ui/home/home.view.dart';
import 'package:financeiro/ui/login/login.view.dart';
import 'package:financeiro/utils/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsivo(context);

    return Container(
      child: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: LoginView(),
        backgroundColor: Theme.of(context).backgroundColor,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 110.0,
        image: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
