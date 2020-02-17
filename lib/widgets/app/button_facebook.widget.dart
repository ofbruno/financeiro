import 'package:flutter/material.dart';
import 'button.widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonFacebookApp extends StatelessWidget {
  final void Function() onPressed;

  ButtonFacebookApp({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new ButtonApp(
      caption: 'Entrar com Facebook',
      color: Color.fromRGBO(59, 89, 152, 1),
      onPressed: this.onPressed,
      iconData: FontAwesomeIcons.facebookF,
    );
  }
}
