import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String formatreal(double valor) {
  // formatar double em moeda brasileira
  var config = NumberFormat.currency(locale: 'pt_BR', symbol: '');
  return 'R\$' + config.format(valor);
}

String totalReal(List<double> cartItemsTotal) {
  final formatter = new NumberFormat("#,##0.00", "pt_BR");
  double _total = cartItemsTotal.fold(
      0.0, (double total, double subtotal) => subtotal + total);
  _total = double.parse(_total.toStringAsFixed(2));
  String resultado = formatter.format(_total);
  return "R\$ " + resultado;
}

double totalQuantidade(List<double> cartItemsTotal) {
  double _total = cartItemsTotal.fold(
      0.0, (double total, double subtotal) => subtotal + total);
  _total = double.parse(_total.toStringAsFixed(2));
  return _total;
}

String somartudo(
  double campo,
  double campo2,
) {
  // formatar número em real
  final formatter = new NumberFormat("#,##0.00", "pt_BR");
  double resultadoz = campo * campo2;
  String resultado = formatter.format(resultadoz);
  return "R\$ " + resultado;
}

double somartudoCopy(
  double campo,
  double campo2,
) {
  // formatar número em real
  double resultadoz = campo * campo2;
  return resultadoz;
}

String formatdate(DateTime dataatual) {
  var inputFormat = DateFormat('dd/MM/yyyy HH:mm');
  var outputFormat = DateFormat('dd/MM/yyyy HH:mm');

  var outputDate = outputFormat.format(dataatual);
  return outputDate;
}
