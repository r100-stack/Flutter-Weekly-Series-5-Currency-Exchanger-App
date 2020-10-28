import 'dart:convert';

import 'package:currency_exchanger_5/blocs/currency_bloc.dart';
import 'package:currency_exchanger_5/constants.dart';
import 'package:currency_exchanger_5/models/currency.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _downloadExchangeRates() async {
    Currency currency;
    String apiUrl =
        'http://api.currencylayer.com/live?access_key=db1c45a37425c2a4505827552618dd09&format=1';

    try {
      http.Response response = await http.get(apiUrl);
      var body = jsonDecode(response.body);
      currency = Currency.fromJson(body);
    } catch (ex) {
      print(ex);
    }

    if (currency != null) {
      Provider.of<CurrencyBloc>(context, listen: false)
          .updateCurrency(currency);
    }
  }

  @override
  void initState() {
    super.initState();
    _downloadExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    Currency currency = Provider.of<CurrencyBloc>(context).currency;
    List<MapEntry<String, double>> quotes = currency?.quotes?.entries?.toList();
    bool isDownloading = Provider.of<CurrencyBloc>(context).isDownloading;

    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Exchanger'),
      ),
      body: isDownloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return _buildCurrencyCard(
                    quotes[index].key, quotes[index].value);
              },
              itemCount: quotes != null ? quotes.length : 0,
            ),
    );
  }

  _buildCurrencyCard(String currency, double quote) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: kDefaultMargin / 2, horizontal: kDefaultMargin / 2),
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 2),
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            currency.substring(3, 6),
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
        title: Text(
          Currency.currencyList[currency.substring(3, 6)],
          style: TextStyle(fontSize: 18.0),
        ),
        trailing: Text(
          quote.toStringAsFixed(3),
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0),
        ),
      ),
    );
  }
}
