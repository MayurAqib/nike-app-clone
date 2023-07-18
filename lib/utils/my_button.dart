import 'package:flutter/material.dart';
import 'package:nike_app_clone/models/product_model.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.title,
      this.containerBackColor = Colors.black,
      required this.onTap,
      this.product,
      this.isFavourite = false});
  final ProductModel? product;
  final Color containerBackColor;
  final String title;
  final void Function() onTap;
  final bool? isFavourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
            color: containerBackColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: containerBackColor == Colors.white
                    ? Colors.grey.shade300
                    : Colors.black)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: containerBackColor == Colors.white
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
