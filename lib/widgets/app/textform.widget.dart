import 'package:financeiro/utils/mascaras.dart';
import 'package:financeiro/utils/responsivo.dart';
import 'package:financeiro/widgets/platform/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormApp extends PlatformTextField {
  final bool enabled;
  final bool readOnly;
  final TextEditingController controller;
  final String label;
  final String placeholder;
  final int maxLength;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String) onSaved;
  final void Function() onEditingComplete;
  final void Function(String) onChange;
  final void Function() onTap;
  final String Function(String) validator;
  final String mascara;
  final InputDecoration inputDecoration;
  final bool password;
  final bool noMarginBottom;
  final TextAlign textAlign;
  final double fontSizeResponsive;
  final bool numbersOnly;
  final Widget suffixIcon;
  final TextCapitalization textCapitalization;
  final bool keepColorActiveWhenReadOnly;

  TextFormApp({
    this.enabled = true,
    this.readOnly = false,
    this.controller,
    this.label,
    this.placeholder,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.onSaved,
    this.onEditingComplete,
    this.onChange,
    this.onTap,
    this.validator,
    this.mascara,
    this.inputDecoration,
    this.password = false,
    this.noMarginBottom = false,
    this.textAlign = TextAlign.left,
    this.fontSizeResponsive = 14,
    this.numbersOnly = false,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.keepColorActiveWhenReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> listaInputFormatters = [LengthLimitingTextInputFormatter(this.maxLength)];

    InputDecoration tipoInputDecoration;
    double marginBottom = this.noMarginBottom ? 0 : 5.0;

    if (this.mascara != null && this.mascara.isNotEmpty) {
      listaInputFormatters.add(MascaraNumericaTextInputFormatter(mask: this.mascara));
    }

    if (this.numbersOnly) {
      listaInputFormatters.add(WhitelistingTextInputFormatter.digitsOnly);
    }

    if (this.inputFormatters != null && this.inputFormatters.length > 0) {
      this.inputFormatters.forEach((f) => listaInputFormatters.add(f));
    }

    if (this.inputDecoration == null) {
      tipoInputDecoration = new InputDecoration(
        hintText: this.placeholder,
        labelText: this.label,
        suffixIcon: this.suffixIcon,
      );
    } else {
      tipoInputDecoration = this.inputDecoration;
    }

    return new Container(
      child: TextFormField(
        enabled: this.enabled,
        readOnly: this.readOnly,
        controller: this.controller,
        keyboardType: this.keyboardType,
        textInputAction: this.textInputAction,
        focusNode: this.focusNode,
        onFieldSubmitted: (v) => FocusScope.of(context).requestFocus(this.nextFocusNode),
        decoration: tipoInputDecoration,
        inputFormatters: listaInputFormatters,
        obscureText: this.password,
        validator: this.validator,
        onSaved: this.onSaved,
        onEditingComplete: this.onEditingComplete,
        onChanged: this.onChange,
        onTap: this.onTap,
        textAlign: this.textAlign,
        textCapitalization: this.textCapitalization,
      ),
      margin: EdgeInsets.only(bottom: marginBottom),
    );
  }
}
