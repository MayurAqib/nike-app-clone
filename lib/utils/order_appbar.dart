import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/tabs_page.dart';
import '../provider/orders_provider.dart';

class OrderAppbar extends StatelessWidget {
  const OrderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrdersProvider>(context);

    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabsPage(),
                    ));
              },
              child: Image.network(
                  'https://cdn-icons-png.flaticon.com/128/732/732084.png',
                  height: 55),
            ),
          ),
          GestureDetector(
              onTap: () {
                order.leavingCheckout(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/128/11278/11278263.png',
                  height: 35,
                ),
              ))
        ],
      ),
    );
  }
}
