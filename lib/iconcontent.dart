import 'package:flutter/material.dart';

class Cc extends StatelessWidget {
  final IconData icon;
  final String txt;
  // ignore: use_key_in_widget_constructors
  Cc({required this.icon, required this.txt});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          txt,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
