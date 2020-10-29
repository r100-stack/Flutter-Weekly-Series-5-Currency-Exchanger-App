import 'package:currency_exchanger_5/blocs/currency_bloc.dart';
import 'package:currency_exchanger_5/blocs/display_bloc.dart';
import 'package:currency_exchanger_5/constants.dart';
import 'package:currency_exchanger_5/models/currency.dart';
import 'package:currency_exchanger_5/utils/filter_utils.dart';
import 'package:currency_exchanger_5/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MapEntry<String, double>> quotes = [];
  TextEditingController controller = TextEditingController();

  _downloadExchangeRates() async {
    Provider
        .of<CurrencyBloc>(context, listen: false)
        .isDownloading = true;

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

    Provider
        .of<CurrencyBloc>(context, listen: false)
        .isDownloading = false;
  }

  @override
  void initState() {
    super.initState();
    _downloadExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    Currency currency = Provider
        .of<CurrencyBloc>(context)
        .currency;
    List<MapEntry<String, double>> quotes = currency?.quotes?.entries?.toList();
    List<MapEntry<String, double>> filteredQuotes =
        Provider
            .of<DisplayBloc>(context)
            .quotes;
    bool isDownloading = Provider
        .of<CurrencyBloc>(context)
        .isDownloading;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            // TODO (7): Wrap the TextField with Padding.all = kDefaultMargin / 2

            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 2),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Filter ...',
                    labelText: 'Filter',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                    // TODO (8): Add a suffix to the TextField to clear the text

                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        controller.clear();
                        Provider.of<DisplayBloc>(context, listen: false).updateQuotes([]);
                      },
                    )
                ),
                onChanged: (text) =>
                    FilterUtils.filterQuotes(context, text, quotes),
              ),
            ),
            Text('1 USD equals ...',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6),

            // TODO (7): Add a SizedBox of height = kDefaultMargin / 2
            const SizedBox(height: kDefaultMargin / 2),

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                child: isDownloading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                    itemBuilder: (context, index) {
                      return controller.text.isNotEmpty
                          ? CurrencyCard(quote: filteredQuotes[index])
                          : CurrencyCard(quote: quotes[index]);
                    },
                    itemCount: controller.text.isNotEmpty
                        ? (filteredQuotes != null
                        ? filteredQuotes.length
                        : 0)
                        : (quotes != null ? quotes.length : 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
