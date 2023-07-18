import 'package:flutter/material.dart';
import 'package:nike_app_clone/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import '../pages/cart_page.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final totalCartItems = Provider.of<CartProvider>(context).totalCartItems;
    return Stack(
      children: [
        Positioned(
            right: 30,
            top: 8,
            child: totalCartItems == 0
                ? const Text('')
                : Text(totalCartItems.toString())),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 10),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/128/11278/11278263.png',
                height: 30,
              )),
        )
      ],
    );
  }
}
