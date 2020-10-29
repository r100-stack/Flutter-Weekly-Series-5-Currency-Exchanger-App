import 'package:flutter/cupertino.dart';

class DisplayBloc extends ChangeNotifier {
  List<MapEntry<String, double>>  _quotes = [];

  List<MapEntry<String, double>> get quotes => _quotes;

  updateQuotes(List<MapEntry<String, double>> quotes) {
    _quotes = quotes;
    notifyListeners();
  }
}