import 'package:currency_exchanger_5/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyBloc extends ChangeNotifier{
  Currency _currency;
  bool isDownloading = true;

  Currency get currency => _currency;

  updateCurrency(Currency currency) {
    _currency = currency;
    notifyListeners();
  }

  updateIsDownloading(bool isDownloading) {
    this.isDownloading = isDownloading;
    notifyListeners();
  }
}