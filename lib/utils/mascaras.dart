import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'funcoes.dart';

class Mascaras {
  static String formatar(String valor, String mascara) {
    if (valor == null || mascara == null) {
      return '';
    }

    if (valor.isEmpty || mascara.isEmpty) {
      return valor;
    }

    String separador;
    String retorno = '';
    int aux = 0;

    var texto = valor.toString().split('');

    for (var i = 0; i < texto.length; i++) {
      if (Funcoes.numeroInteiro(mascara[i + aux])) {
        separador = '';
      } else {
        separador = mascara[i + aux];
        aux++;
      }

      retorno += separador + texto[i];
    }

    return retorno;
  }
}

class MascaraNumericaTextInputFormatter extends TextInputFormatter {
  final String mask;
  String separador;

  MascaraNumericaTextInputFormatter({@required this.mask}) {
    assert(mask != null);
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;

        if (Funcoes.numeroInteiro(mask[newValue.text.length - 1])) {
          separador = '';
        } else {
          separador = mask[newValue.text.length - 1];
        }

        if (newValue.text.length < mask.length && separador.isNotEmpty) {
          return TextEditingValue(
            text: oldValue.text + separador + newValue.text.substring(newValue.text.length - 1),
            selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
        }
      }
    }
    return newValue;
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = new NumberFormat("###,##0.00", "pt-br");

    String newText = 'R\$ ${formatter.format(value / 100)}';

    return newValue.copyWith(text: newText, selection: new TextSelection.collapsed(offset: newText.length));
  }
}
