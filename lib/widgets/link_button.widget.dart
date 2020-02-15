import 'package:financeiro/utils/responsivo.dart';
import 'package:flutter/material.dart';

class LinkButtonApp extends StatelessWidget {
  final Color color;
  final String label;
  final double marginTop = 20.0;
  final Function onTap;

  LinkButtonApp({Key key, this.color, this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: this.marginTop),
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.button.fontSize,
            color: this.color ?? Theme.of(context).primaryColor,
            fontWeight: Theme.of(context).textTheme.button.fontWeight,
          ),
        ),
      ),
      onTap: this.onTap,
    );
  }
}
