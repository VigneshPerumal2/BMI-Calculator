import 'package:flutter/material.dart';
import 'constants.dart';


class ReusableCard extends StatelessWidget {
  final int colour;
  final Widget Child;
  final Function sex;
  ReusableCard({@required this.colour, this.Child,this.sex}) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: sex,
      child: Container(
        child: Child,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Color(colour)),
      ),
    );
  }
}
