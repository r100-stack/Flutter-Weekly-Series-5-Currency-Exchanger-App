import 'package:currency_exchanger_5/blocs/currency_bloc.dart';
import 'package:currency_exchanger_5/blocs/display_bloc.dart';
import 'package:currency_exchanger_5/models/currency.dart';
import 'package:currency_exchanger_5/utils/filter_utils.dart';
import 'package:currency_exchanger_5/widgets/currency_card.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      // TODO (1): Wrap the Column in a SafeArea()
      body: Column(
        children: [

          // TODO (2): Add a TextField()
          // TODO (3): TextField.controller = controller
          // TODO (4): TextField.decoration = InputDecoration
          // TODO (5): InputDecoration.hintText = 'Filter...'
          // TODO (6): InputDecoration.labelText = 'Filter'
          // TODO (7): InputDecoration.border = OutlineInputBorder
          // TODO (8): OutlineInputBorder.borderRadius = BorderRadius.circular(20.0)
          // TODO (9): TextField.onChanged = FilterUtils.filterQuotes(context, text, quotes)
          // TextField(
          //   controller: controller,
          //   decoration: InputDecoration(
          //     hintText: 'Filter ...',
          //     labelText: 'Filter',
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(20.0),
          //     ),
          //   onChanged: (text) =>
          //     FilterUtils.filterQuotes(context, text, quotes),
          //   ),

          Text('1 USD equals ...',
              style: Theme.of(context).textTheme.headline6),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return null;
                },
                itemCount: 0),
          ),
        ],
      ),
    );
  }
}
