import 'package:flutter/material.dart';
import 'package:nike_app_clone/pages/tabs_page.dart';
import 'package:nike_app_clone/provider/filter_and_favorites_provider.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../utils/cart_tile.dart';
import '../utils/checkout_tile.dart';
import 'orders_related/delivery_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final favourites = Provider.of<FilterFavouritesProvider>(context);
    //!  BODY IF CART IS  EMPTY
    Widget widget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black)),
            child: Image.network(
              'https://cdn-icons-png.flaticon.com/128/8204/8204059.png',
              height: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Your Bag is empty',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const Text(
            'When you add products, they\'ll appear\nhere.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );

//! IF ITEMS ARE THERE IN BAG
    if (cartProvider.cartItems.isNotEmpty) {
      widget = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.cartItems[index];
                  final product = cartItem.product;
                  return CartTile(
                    cart: cartItem,
                    isFavourite: product.isFavorite,
                    isDelete: cartProvider.isDelete,
                    onDelete: () {
                      cartProvider.deleteItemFromCart(cartItem, context);
                    },
                    onFavourite: () {
                      favourites.addToFavourites(product, context);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Subtotal', style: TextStyle(color: Colors.grey)),
                  Text(
                    '₹ ${cartProvider.totalCartPrice.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery', style: TextStyle(color: Colors.grey)),
                  Text(
                    'Free',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Estimated Total',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    '₹ ${cartProvider.totalCartPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bag'),
      ),
      body: widget,
      bottomNavigationBar: CheckOutTile(
        onTap: () {
          if (cartProvider.cartItems.isEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TabsPage()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DeliveryPage()));
          }
        },
        title: cartProvider.gettingButtonText,
      ),
    );
  }
}
