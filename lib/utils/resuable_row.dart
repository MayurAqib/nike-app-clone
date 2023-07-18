import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  const ReusableRow(
      {super.key, required this.heading, required this.data, this.fontWeight});
  final String heading;
  final String data;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: TextStyle(fontSize: 16, fontWeight: fontWeight),
        ),
        Text(
          data,
          style: TextStyle(fontSize: 16, fontWeight: fontWeight),
        )
      ],
    );
  }
}
