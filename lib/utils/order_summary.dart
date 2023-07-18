import 'package:flutter/material.dart';
import 'package:nike_app_clone/utils/resuable_row.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../provider/orders_provider.dart';
import 'information_message.dart';
import 'order_summary_items.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final order = Provider.of<OrdersProvider>(context);

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: order.visibility
                  ? const BorderSide(color: Colors.transparent)
                  : BorderSide(color: Colors.grey.shade300)),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Summary',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                        '₹ ${cartProvider.totalCartPrice} (${cartProvider.cartItems.length} items)'),
                    InkWell(
                        splashColor: Colors.red,
                        radius: 30,
                        onTap: () {
                          order.summaryVisibility();
                        },
                        child: Icon(order.visibility
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down))
                  ],
                ),
              ],
            ),
            if (order.visibility == true) ...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  final cartItem = cartProvider.cartItems[index];
                  return OrderSummaryItems(
                    cartLength: cartProvider.cartItems.length.toString(),
                    cart: cartItem,
                    totalOrderPrice: cartProvider.totalCartPrice,
                  );
                },
              ),
              const SizedBox(height: 20),
              ReusableRow(
                  heading: 'Subtotal',
                  data: cartProvider.totalCartPrice.toStringAsFixed(2)),
              const SizedBox(height: 10),
              const ReusableRow(heading: 'Delivery/Shipping', data: 'Free'),
              const SizedBox(height: 10),
              const Divider(),
              ReusableRow(
                heading: 'Total',
                data: cartProvider.totalCartPrice.toStringAsFixed(2),
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 25),
              const InformationMessage(
                  text:
                      '(The total reflects the price of your order, including all duties and taxes)')
            ],
          ],
        ));
  }
}
