import 'package:flutter/material.dart';

import 'my_button.dart';

class CheckOutTile extends StatelessWidget {
  const CheckOutTile({super.key, required this.title, required this.onTap});
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade200))),
      child: MyButton(
        title: title,
        onTap: onTap,
      ),
    );
  }
}
