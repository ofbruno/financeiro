import 'package:financeiro/utils/responsivo.dart';
import 'package:financeiro/widgets/platform/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final double kBorderRadius = 5;
  final double kHeight = 45;
  final double kMarginTop = 10;
  final double kMarginBottom = 0;

  final String caption;
  final void Function() onPressed;
  final bool flat;
  final bool wide;
  final FocusNode focusNode;
  final Color color;
  final Color captionColor;
  final double marginTop;
  final double marginBottom;
  final bool noMargin;
  final double height;
  final double width;
  final IconData iconData;
  final Color iconColor;
  final bool busy;
  final bool disabled;

  ButtonApp({
    this.caption,
    this.onPressed,
    this.flat = false,
    this.wide = true,
    this.focusNode,
    this.color,
    this.captionColor,
    this.marginTop,
    this.marginBottom,
    this.noMargin = false,
    this.height,
    this.width,
    this.iconData,
    this.iconColor,
    this.busy = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    PlatformButton botao;
    Color corBotao;

    double largura;
    double altura;

    largura = this.wide ? Responsivo.larguraTela : this.width;
    altura = this.height ?? kHeight;
    corBotao = this.color ?? Theme.of(context).primaryColor;

    botao = this._criarBotao(context, altura * 0.5, largura, corBotao);

    return new Container(
      width: largura,
      height: altura,
      child: botao,
      margin: new EdgeInsets.only(
        top: this.noMargin ? 0.0 : (this.marginTop ?? kMarginTop),
        bottom: (this.noMargin) ? 0.0 : (this.marginBottom ?? kMarginBottom),
      ),
    );
  }

  Widget _criarBotao(BuildContext context, double tamanhoSpinner, double larguraBotao, Color cor) {
    PlatformButton botao;
    Text textBotao = _criarTextoBotao(context);
    Widget spinner = _criarSpinnerBotao(tamanhoSpinner);
    Widget icone;

    if (this.iconData != null) {
      icone = Stack(
        alignment: Alignment(0, 0),
        children: <Widget>[
          Container(
            height: this.height ?? kHeight,
            width: larguraBotao,
            alignment: Alignment(0.0, 0.0),
            child: textBotao,
          ),
          Positioned(
            height: this.height ?? kHeight,
            right: 0,
            top: 0,
            child: Icon(
              iconData,
              color: iconColor,
              size: Theme.of(context).textTheme.button.fontSize,
            ),
          ),
        ],
      );
    }

    if (this.flat) {
      botao = new PlatformButton(
        padding: EdgeInsets.symmetric(horizontal: Responsivo.fracaoLarguraTela(5)),
        focusNode: this.focusNode,
        elevation: 0,
        child: this.busy ? spinner : textBotao,
        color: cor,
        onPressed: () => _onPressedAppButton(),
        androidFlat: (_) => MaterialFlatButtonData(),
        ios: (_) => CupertinoButtonData(color: Theme.of(context).backgroundColor),
      );
    } else {
      botao = new PlatformButton(
        padding: EdgeInsets.symmetric(horizontal: Responsivo.fracaoLarguraTela(5)),
        focusNode: this.focusNode,
        elevation: 0,
        child: this.busy ? spinner : (icone == null ? textBotao : icone),
        color: cor,
        onPressed: () => _onPressedAppButton(),
      );
    }

    return botao;
  }

  void _onPressedAppButton() {
    if (this.busy || this.disabled) {
      return;
    }

    this.onPressed();
  }

  Widget _criarTextoBotao(BuildContext context) {
    return Text(
      this.caption,
      style: TextStyle(
        color: this.flat ? Theme.of(context).primaryColor : this.captionColor,
      ),
    );
  }

  Widget _criarSpinnerBotao(double tamanho) {
    return Container(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 2.0,
      ),
      height: tamanho,
      width: tamanho,
    );
  }
}
