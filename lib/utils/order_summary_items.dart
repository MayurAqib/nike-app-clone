import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class OrderSummaryItems extends StatelessWidget {
  const OrderSummaryItems(
      {super.key,
      required this.cartLength,
      required this.totalOrderPrice,
      required this.cart});

  final CartModel cart;
  final String cartLength;
  final double totalOrderPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(cart.product.imageUrl,
                height: 170, width: 170, fit: BoxFit.cover),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product.name,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  Text(cart.product.type),
                  Text('Qty $cartLength'),
                  Text(cart.totalPrice.toStringAsFixed(2))
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
