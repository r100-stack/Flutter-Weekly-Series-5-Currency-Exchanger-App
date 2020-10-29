import 'package:currency_exchanger_5/blocs/display_bloc.dart';
import 'package:currency_exchanger_5/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterUtils {
  static filterQuotes(BuildContext context, String text,
      List<MapEntry<String, double>> quotes) {
    List<MapEntry<String, double>> filteredQuotes = [];

    for (MapEntry<String, double> e in quotes) {
      String code = e.key.substring(3);
      bool isCode = code.contains(text.toUpperCase()); // eg. AED = AED DIRHAMS

      String fullForm = Currency.currencyList[e.key.substring(3)].toLowerCase();
      bool isFullForm = fullForm.contains(text.toLowerCase());

      if (isCode || isFullForm) {
        filteredQuotes.add(e);
      }
    }

    Provider.of<DisplayBloc>(context, listen: false)
        .updateQuotes(filteredQuotes);
  }
}
