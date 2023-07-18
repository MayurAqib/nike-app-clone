import 'package:flutter/material.dart';

class InformationMessage extends StatelessWidget {
  const InformationMessage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Text(text,
            style: const TextStyle(color: Colors.grey, fontSize: 10)));
  }
}
