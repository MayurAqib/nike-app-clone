import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline(
      {super.key, required this.headline, this.color = Colors.black});
  final String headline;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: color),
    );
  }
}
