import 'package:flutter/material.dart';
import 'package:nike_app_clone/models/cart_model.dart';

class CartItemsImage extends StatelessWidget {
  const CartItemsImage({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: Image.network(
        cartModel.product.imageUrl,
        height: 100,
        width: 100,
      ),
    );
  }
}
