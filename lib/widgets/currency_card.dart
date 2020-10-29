import 'package:currency_exchanger_5/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final MapEntry<String, double> quote;

  const CurrencyCard({this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(

      // TODO (5): Container.child = ListTile
      // TODO (6): ListTile.leading = CircleAvatar
      // TODO (7): CircleAvatar.child = Text(GBP)
      // TODO (8): CircleAvatar.backgroundColor = Theme.of(context).accentColor
      // leading: CircleAvatar(
      //   child: Text(
      //     quote.key.substring(3, 6),
      //   ),
      //   backgroundColor: Theme.of(context).accentColor,
      // ),

      // TODO (9): ListTile.title = Text(British Pounds)
      // TODO (10): Text.style.fontSize = 18.0
      // title: Text(
      //   Currency.currencyList[quote.key.substring(3, 6)],
      //   style: TextStyle(fontSize: 18.0),
      // ),

      // TODO (11): ListTile.trailing = Text(14.983)
      // TODO (12): Text.style = accentColor, w600, 18.0
      // trailing: Text(
      //   quote.value.toStringAsFixed(3),
      //   style: TextStyle(
      //     color: Theme.of(context).accentColor,
      //     fontWeight: FontWeight.w600,
      //     fontSize: 18.0),
      //   ),
      // ),

      // TODO (13): Add margin to container
      // margin: const EdgeInsets.symmetric(
      //   vertical: kDefaultMargin / 2, horizontal: kDefaultMargin / 2),
      // padding: const EdgeInsets.symmetric(
      //   horizontal: kDefaultMargin / 2, vertical: kDefaultMargin / 2),
      // decoration: BoxDecoration(
      //   color: Colors.black45,
      //   borderRadius: BorderRadius.circular(kDefaultBorderRadius)),

    );
  }
}
