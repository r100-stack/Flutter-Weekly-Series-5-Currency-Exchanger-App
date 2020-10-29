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

  _downloadExchangeRates() async {
    // TODO (2): Set isDownloading of Provider to true

    // TODO (3): Make a request to API's url
    // TODO (4): Parse the response
    // TODO (5): Save response in a currency variable using the factory constructor

    // TODO (6): If currency != null, update the currency in the Provider

    // TODO (7): Set isDownloading of Provider to false

    // Provider.of<CurrencyBloc>(context, listen: false).isDownloading = true;
    //
    // Currency currency;
    // String apiUrl =
    //     'http://api.currencylayer.com/live?access_key=db1c45a37425c2a4505827552618dd09&format=1';
    //
    // try {
    //   http.Response response = await http.get(apiUrl);
    //   var body = jsonDecode(response.body);
    //   currency = Currency.fromJson(body);
    // } catch (ex) {
    //   print(ex);
    // }
    //
    // if (currency != null) {
    //   Provider.of<CurrencyBloc>(context, listen: false)
    //       .updateCurrency(currency);
    // }
    //
    // Provider.of<CurrencyBloc>(context, listen: false).isDownloading = false;
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
