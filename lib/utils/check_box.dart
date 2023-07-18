import 'package:flutter/material.dart';
import 'package:nike_app_clone/provider/orders_provider.dart';
import 'package:provider/provider.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrdersProvider>(context);
    final isChecked = Provider.of<OrdersProvider>(context).isChecked;
    return GestureDetector(
      onTap: () {
        orderProvider.isCheckedBox;
      },
      child: Container(
        margin: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isChecked ? Colors.black : Colors.white,
            border: Border.all(
                color: isChecked ? Colors.black : Colors.grey, width: 2)),
        child: Icon(
          Icons.check,
          size: 15,
          color: isChecked ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}
