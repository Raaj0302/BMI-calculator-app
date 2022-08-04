import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  // ignore: prefer_const_constructors_in_immutables
  ReusableCard({required this.colour, required this.cardChild});
  // TODO: implement

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF1d1E33),
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
