import 'package:financeiro/utils/responsivo.dart';
import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final String label;
  final FocusNode focusNode;
  final void Function() onPressed;
  final Color color;
  final Color labelColor;
  final double marginTop;
  final double marginBottom;
  final bool outlineButton;
  final bool noMargin;
  final double height;
  final double width;
  final IconData iconData;
  final Color iconColor;
  final bool iconLeft;
  final bool loading;
  final bool disabled;
  final double borderRadius;

  ButtonApp({
    this.label,
    this.focusNode,
    this.onPressed,
    this.color,
    this.labelColor = Colors.white,
    this.marginTop,
    this.marginBottom = 0.0,
    this.outlineButton = false,
    this.noMargin = false,
    this.height = 0.0,
    this.width = 0.0,
    this.iconData,
    this.iconColor = Colors.white,
    this.iconLeft = false,
    this.loading = false,
    this.disabled = false,
    this.borderRadius = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    MaterialButton botao;
    Color corBotao;
    double marginTop = Responsivo.fracaoAlturaTela(3);
    double largura;
    double altura;

    if (marginTop < 10.0) {
      marginTop = 10.0;
    }

    if (this.width > 0) {
      largura = this.width;
    } else {
      largura = Responsivo.larguraTela;
    }

    if (this.height > 0) {
      altura = this.height;
    } else {
      altura = Responsivo.fracaoAlturaTela(7);
    }

    if (this.color == null) {
      corBotao = Theme.of(context).primaryColor;
    } else {
      corBotao = this.color;
    }

    botao = this._criarBotao(altura * 0.5, largura, corBotao);

    return new Container(
      width: largura,
      height: altura,
      child: botao,
      margin: new EdgeInsets.only(
        top: (this.noMargin) ? 0 : marginTop,
        bottom: (this.noMargin) ? 0 : marginBottom,
      ),
    );
  }

  Widget _criarBotao(double tamanhoSpinner, double larguraBotao, Color cor) {
    MaterialButton botao;
    Text textBotao = _criarTextoBotao();
    Widget spinner = _criarSpinnerBotao(tamanhoSpinner);
    Widget icone;

    if (this.iconData != null) {
      icone = Stack(
        children: <Widget>[
          Container(
            width: larguraBotao,
            alignment: Alignment(0.0, 0.0),
            child: textBotao,
          ),
          Positioned(
            right: 0,
            top: tamanhoSpinner / 1.5,
            child: Icon(
              iconData,
              color: iconColor,
              size: Responsivo.fonte(16),
            ),
          ),
        ],
      );
    }

    if (this.outlineButton) {
      if (this.iconData == null) {
        botao = new OutlineButton(
          focusNode: this.focusNode,
          child: this.loading ? spinner : textBotao,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(this.borderRadius),
          ),
          borderSide: BorderSide(
            color: this.labelColor,
          ),
          color: cor,
          focusColor: cor,
          onPressed: () => _onPressedAppButton(),
        );
      } else {
        botao = new OutlineButton(
          focusNode: this.focusNode,
          child: this.loading ? spinner : icone,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(this.borderRadius),
          ),
          borderSide: BorderSide(
            color: this.labelColor,
          ),
          color: cor,
          focusColor: cor,
          onPressed: () => _onPressedAppButton(),
        );
      }
    } else {
      if (this.iconData == null) {
        botao = new RaisedButton(
          elevation: 0,
          focusNode: this.focusNode,
          child: this.loading ? spinner : textBotao,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(this.borderRadius),
          ),
          color: cor,
          focusColor: cor,
          onPressed: () => _onPressedAppButton(),
        );
      } else {
        botao = new RaisedButton(
          focusNode: this.focusNode,
          elevation: 0,
          child: this.loading ? spinner : icone,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(this.borderRadius),
          ),
          color: cor,
          focusColor: cor,
          onPressed: () => _onPressedAppButton(),
        );
      }
    }

    return botao;
  }

  void _onPressedAppButton() {
    if (this.loading || this.disabled) {
      return;
    }

    this.onPressed();
  }

  Widget _criarTextoBotao() {
    return Text(
      this.label,
      style: TextStyle(
        color: this.labelColor,
        fontWeight: FontWeight.w400,
        //fontSize: Responsivo.fonte(this.fontSizeResposivo),
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
