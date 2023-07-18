import 'package:flutter/material.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow(
      {super.key,
      required this.navigateTo,
      required this.title,
      required this.iconData});
  final Widget navigateTo;
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigateTo));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 7),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              iconData,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
