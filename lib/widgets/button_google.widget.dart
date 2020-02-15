import 'package:financeiro/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonAppGoogle extends StatelessWidget {
  final void Function() onPressed;

  ButtonAppGoogle({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new ButtonApp(
      label: 'Entrar com Google',
      color: Color.fromRGBO(219, 68, 55, 1),
      onPressed: this.onPressed,
      iconData: FontAwesomeIcons.google,
      iconLeft: true,
    );
  }
}
