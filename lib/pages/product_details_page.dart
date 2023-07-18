import 'package:flutter/material.dart';
import 'package:nike_app_clone/provider/filter_and_favorites_provider.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../provider/cart_provider.dart';
import '../utils/app_bar_action_icons.dart';
import '../utils/my_button.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: const [AppBarActionIcon()],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.type),
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text('MRP: ${product.price.toStringAsFixed(2)}'),
                  const Text(
                      'Incl. of taxes\n(Also includes all applicable duties)'),
                  const SizedBox(height: 40),
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(child: Text('Description comes here')),
                  ),
                  const SizedBox(height: 30),
                  const Text('View Product Details'),
                  const SizedBox(height: 20),
                  MyButton(
                      title: 'Add to Bag',
                      onTap: () {
                        cart.addToCart(product, context);
                      }),
                  favouriteContainer(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget favouriteContainer(BuildContext context) {
    final favourite = Provider.of<FilterFavouritesProvider>(context);
    return GestureDetector(
      onTap: () {
        favourite.addToFavourites(product, context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 58,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Favourite',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              const SizedBox(width: 10),
              Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border)
            ],
          ),
        ),
      ),
    );
  }
}
