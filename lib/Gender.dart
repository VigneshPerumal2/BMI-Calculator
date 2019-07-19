import 'package:flutter/material.dart';
import 'constants.dart';

class Gender extends StatelessWidget {
  final IconData x;
  final String label;
  Gender({this.x, this.label}) {}
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          x,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(label, style: kTstyle)
      ],
    );
  }
}
