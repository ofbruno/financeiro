import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Funcoes {
  static bool numeroInteiro(String s) {
    int aux;

    try {
      aux = int.tryParse(s);
      return (aux != null);
    } catch (e) {
      return false;
    }
  }

  static bool numeroDouble(String s) {
    double aux;

    try {
      aux = double.tryParse(s);
      return (aux != null);
    } catch (e) {
      return false;
    }
  }

  static String mesNome({DateTime data, bool reduzido = false}) {
    String mes = '';

    switch (data.month) {
      case 1:
        mes = 'Janeiro';
        break;
      case 2:
        mes = 'Fevereiro';
        break;
      case 3:
        mes = 'Março';
        break;
      case 4:
        mes = 'Abril';
        break;
      case 5:
        mes = 'Maio';
        break;
      case 6:
        mes = 'Junho';
        break;
      case 7:
        mes = 'Julho';
        break;
      case 8:
        mes = 'Agosto';
        break;
      case 9:
        mes = 'Setembro';
        break;
      case 10:
        mes = 'Outubro';
        break;
      case 11:
        mes = 'Novembro';
        break;
      case 12:
        mes = 'Dezembro';
        break;
      default:
    }

    return reduzido ? mes.substring(0, 3) : mes;
  }

  static String mesAno({DateTime data}) {
    if (data == null) {
      return '';
    }

    return '${mesNome(data: data)}/${data.year}';
  }

  static String diaMes({DateTime data}) {
    if (data == null) {
      return '';
    }

    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}';
  }

  static String horaMinuto({DateTime data}) {
    if (data == null) {
      return '';
    }

    return '${data.hour.toString().padLeft(2, '0')}h${data.minute.toString().padLeft(2, '0')}';
  }

  static int obterDDD(String telefone) {
    var aux = somenteNumeros(telefone);

    if (aux.length >= 2) {
      return int.parse(aux.substring(0, 2));
    }

    return 0;
  }

  static double removerDDD(String telefone) {
    var aux = somenteNumeros(telefone);

    if (aux.length > 2) {
      return double.parse(aux.substring(2));
    }

    return 0;
  }

  static String somenteNumeros(String texto) {
    if (texto == null || texto.isEmpty) {
      return '';
    }

    var array = texto.split('');
    String aux = '';

    array.forEach((f) {
      if (numeroInteiro(f)) {
        aux += f;
      }
    });

    return aux;
  }

  static String validarEmail(valor) {
    if (valor.isEmpty) {
      return 'Informe seu e-mail';
    }
    String p = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' + '\\@' + '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' + '(' + '\\.' + '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' + ')+';
    RegExp regExp = new RegExp(p);

    if (!regExp.hasMatch(valor)) {
      return 'Informe um e-mail válido';
    }
    return null;
  }

  static bool validarCPF(String cpf) {
    if (cpf == null || cpf.isEmpty) {
      return false;
    }

    cpf = somenteNumeros(cpf);
    cpf = completarComZeros(cpf, 11);

    int soma = 0;
    int resto;

    const List<String> _blacklist = [
      '00000000000',
      '11111111111',
      '22222222222',
      '33333333333',
      '44444444444',
      '55555555555',
      '66666666666',
      '77777777777',
      '88888888888',
      '99999999999',
      '12345678909'
    ];

    if (_blacklist.indexOf(cpf) != -1) {
      return false;
    }

    for (int i = 1; i <= 9; i++) {
      soma = soma + int.parse(cpf.substring(i - 1, i)) * (11 - i);
    }

    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) {
      resto = 0;
    }

    if (resto != int.parse(cpf.substring(9, 10))) {
      return false;
    }

    soma = 0;

    for (int i = 1; i <= 10; i++) {
      soma = soma + int.parse(cpf.substring(i - 1, i)) * (12 - i);
    }

    resto = (soma * 10) % 11;

    if ((resto == 10) || (resto == 11)) {
      resto = 0;
    }

    if (resto != int.parse(cpf.substring(10, 11))) {
      return false;
    }

    return true;
  }

  static bool validarTelefone(String telefone) {
    telefone = somenteNumeros(telefone);

    if (telefone.length < 10) {
      return false;
    }

    return true;
  }

  static String completarComZeros(String numero, int tamanho) {
    if (numero == null || numero.length == 0) {
      return numero;
    }

    if (numero.length >= tamanho) {
      return numero;
    }

    int qtde = tamanho - numero.length;
    String aux = '';

    for (var i = 0; i < qtde; i++) {
      aux += '0';
    }

    return aux + numero;
  }

  static String capitalize(String texto) {
    if (texto == null || texto.isEmpty) {
      return '';
    }

    List<String> lista = texto.split(' ');
    String retorno = '';

    lista.forEach((palavra) {
      retorno += palavra[0].toUpperCase() + palavra.substring(1).toLowerCase();
    });

    return retorno;
  }

  static String formatarMoeda(double valor, [bool ocultarCifrao = false]) {
    if (valor == null) {
      valor = 0.0;
    }

    final formatter = new NumberFormat("###,##0.00", "pt-br");

    if (ocultarCifrao)
      return '${formatter.format(valor)}';
    else
      return 'R\$ ${formatter.format(valor)}';
  }

  static bool validarMesAno(String mesAno, {bool naoPodeMesAnoInferior = false}) {
    if (mesAno == null || mesAno.length < 7) {
      return false;
    }

    List<String> aux = mesAno.split('/');

    if (aux.length != 2) {
      return false;
    }

    if (!numeroInteiro(aux[0])) {
      return false;
    }

    if (!numeroInteiro(aux[1])) {
      return false;
    }

    if (int.parse(aux[0]) < 1 || int.parse(aux[0]) > 12) {
      return false;
    }

    if (naoPodeMesAnoInferior && int.parse(aux[1]) < DateTime.now().year) {
      return false;
    }

    return true;
  }

  static bool validarData(String data) {
    if (data == null || data.isEmpty) {
      return false;
    }

    if (data.length != 10) {
      return false;
    }

    List<String> aux = data.split('/');

    if (aux.length != 3) {
      return false;
    }

    if (int.parse(aux[0]) < 1 || int.parse(aux[0]) > 31) {
      return false;
    }

    if (int.parse(aux[1]) < 1 || int.parse(aux[1]) > 12) {
      return false;
    }

    if (int.parse(aux[2]) > DateTime.now().year) {
      return false;
    }

    return true;
  }

  static List<String> estados() {
    return List<String>()
      ..addAll([
        "AC",
        "AL",
        "AP",
        "AM",
        "BA",
        "CE",
        "DF",
        "ES",
        "GO",
        "MA",
        "MT",
        "MS",
        "MG",
        "PA",
        "PB",
        "PR",
        "PE",
        "PI",
        "RJ",
        "RN",
        "RS",
        "RO",
        "RR",
        "SC",
        "SP",
        "SE",
        "TO",
      ]);
  }
}
