import 'package:flutter/material.dart';

class DynamicContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const DynamicContainer({this.child, this.maxWidth = 800});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}
