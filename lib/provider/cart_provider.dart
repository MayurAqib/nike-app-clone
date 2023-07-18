import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  String buttonText = '';
  List<CartModel> cartItems = [];

  void addToCart(ProductModel product, BuildContext context) {
    final existingCartItem = cartItems.firstWhere(
      (item) => item.product == product,
      orElse: () =>
          CartModel(product: product, quantity: 0, totalPrice: product.price),
    );
    if (existingCartItem.quantity > 0) {
      final itemQuantity = existingCartItem.quantity += 1;
      existingCartItem.totalPrice = existingCartItem.quantity * product.price;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Added to Cart (Qty: $itemQuantity)'),
          GestureDetector(
            onTap: () {},
            child: Text(
              'UNDO',
              style: TextStyle(color: Colors.red.shade300),
            ),
          )
        ],
      )));
    } else {
      final cartItem =
          CartModel(product: product, quantity: 1, totalPrice: product.price);
      cartItems.add(cartItem);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Added to Cart'),
          GestureDetector(
            onTap: () {},
            child: Text(
              'UNDO',
              style: TextStyle(color: Colors.red.shade300),
            ),
          )
        ],
      )));
    }
    notifyListeners();
  }

  bool isDelete = false;

  //! Delete item from cart
  void deleteItemFromCart(CartModel cartItem, BuildContext context) async {
    isDelete = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    cartItems.removeWhere((item) => item.product == cartItem.product);
    if (context.mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Item removed from Cart')));
    }

    notifyListeners();
  }

  //! TOTAL ITEMS IN CART
  int get totalCartItems {
    int totalCount = 0;
    for (final cartItem in cartItems) {
      totalCount += cartItem.quantity;
    }
    return totalCount;
  }

  //! TOTAL price of CART Items

  double get totalCartPrice {
    double total = 0;
    for (final cartItem in cartItems) {
      total += cartItem.totalPrice;
    }
    return total;
  }

  String get gettingButtonText {
    if (cartItems.isNotEmpty) {
      buttonText = 'Checkout';
    } else {
      buttonText = 'Shop';
    }

    return buttonText;
  }
}
