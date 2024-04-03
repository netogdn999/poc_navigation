import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

extension DateTimeFormatter on DateTime {
  String toStringBr() {
    return DateFormat("d/MM/y").format(this);
  }
}

String currencyFormatBr(double value) {
  return NumberFormat.currency(locale: "pt_BR", symbol: "R\$", decimalDigits: 2).format(value);
}

double? currencytoDouble(String? value) {
  if(value == null) {
    return null;
  }
  final currencyString = value.replaceAll("R\$", "").replaceAll(",", "").replaceAll(".", "").trim();
  return double.parse(currencyString)/100;
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {
  final int? maxDigits;
  CurrencyPtBrInputFormatter({this.maxDigits});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final double isNegative = newValue.text.contains("-") ? -1 : 1;
    
    if (maxDigits != null && newValue.selection.baseOffset > maxDigits!) {
      return oldValue;
    }

    final double value = double.parse(newValue.text.replaceAll("-", "")) * isNegative;
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    final String newText = "R\$ ${formatter.format(value / 100)}";
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}