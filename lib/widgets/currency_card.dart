import 'package:currency_exchanger_5/constants.dart';
import 'package:currency_exchanger_5/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final MapEntry<String, double> quote;

  const CurrencyCard({this.quote});

  @override
  Widget build(BuildContext context) {
    // TODO (8): Take the dynamic values using the quote variable

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
            'GBP',
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
        title: Text(
          'British Pounds',
          style: TextStyle(fontSize: 18.0),
        ),
        trailing: Text(
          '14.983',
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0),
        ),
      ),
    );
  }
}
