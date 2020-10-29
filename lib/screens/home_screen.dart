import 'package:currency_exchanger_5/blocs/currency_bloc.dart';
import 'package:currency_exchanger_5/blocs/display_bloc.dart';
import 'package:currency_exchanger_5/constants.dart';
import 'package:currency_exchanger_5/models/currency.dart';
import 'package:currency_exchanger_5/utils/filter_utils.dart';
import 'package:currency_exchanger_5/widgets/currency_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MapEntry<String, double>> quotes = [];
  TextEditingController controller = TextEditingController();

  _downloadExchangeRates() async {}

  @override
  void initState() {
    super.initState();
    _downloadExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    // TODO (12): Create variables for currency, quotes, filteredQuotes, and isDownloading
    // TODO (13): Assign the correct values to all the variables
    // Currency currency = Provider.of<CurrencyBloc>(context).currency;
    // List<MapEntry<String, double>> quotes = currency?.quotes?.entries?.toList();
    // List<MapEntry<String, double>> filteredQuotes =
    //     Provider.of<DisplayBloc>(context).quotes;
    // bool isDownloading = Provider.of<CurrencyBloc>(context).isDownloading;

    Currency currency = Provider.of<CurrencyBloc>(context).currency;
    List<MapEntry<String, double>> quotes = currency?.quotes?.entries?.toList();
    List<MapEntry<String, double>> filteredQuotes =
        Provider.of<DisplayBloc>(context).quotes;
    bool isDownloading = Provider.of<CurrencyBloc>(context).isDownloading;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Filter ...',
                labelText: 'Filter',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: (text) =>
                  FilterUtils.filterQuotes(context, text, quotes),
            ),
            Text('1 USD equals ...',
                style: Theme.of(context).textTheme.headline6),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),

                // TODO (14): If Provider's isDownloading = true, show CircularLoadingIndicator
                // TODO (15): Else, show list view

                // TODO (16): Wrap the entire child of Expanded with ClipRRect (kDefaultBorderRadius)

                child: isDownloading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                    itemBuilder: (context, index) {

                      // TODO (17): If text = empty, pass appropriate "filteredQuotes"
                      // TODO (18): Else return appropriate "quotes"

                      return controller.text.isNotEmpty
                          ? CurrencyCard(quote: filteredQuotes[index])
                          : CurrencyCard(quote: quotes[index]);
                    },

                    // TODO (19): If text = empty, pass filteredQuotes.length
                    // TODO (20): Else return appropriate quotes.length

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
