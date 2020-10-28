import 'package:currency_exchanger_5/models/currency.dart';
import 'package:flutter/cupertino.dart';

class CurrencyBloc extends ChangeNotifier{
  Currency _currency;
  bool _isDownloading = false;

  Currency get currency => _currency;
  bool get isDownloading => _isDownloading;

  updateCurrency(Currency currency) {
    _currency = currency;
    notifyListeners();
  }

  updateIsDownloading(bool isDownloading) {
    _isDownloading = true;
    notifyListeners();
  }
}