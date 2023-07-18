import 'package:flutter/material.dart';

class BottomTextTile extends StatelessWidget {
  const BottomTextTile(
      {super.key, required this.text, this.textColor = Colors.black});
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 30),
      alignment: const Alignment(-1, 0),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300))),
      child: Text(
        '   $text',
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.w500, fontSize: 22),
      ),
    );
  }
}
