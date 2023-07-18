import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../pages/product_details_page.dart';
import '../provider/filter_and_favorites_provider.dart';

class ProductOverViewTile extends StatelessWidget {
  const ProductOverViewTile({super.key, required this.product, this.onCart});
  final ProductModel product;
  final void Function()? onCart;

  @override
  Widget build(BuildContext context) {
    final favourites = Provider.of<FilterFavouritesProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product)));
        },
        child: SizedBox(
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        image: DecorationImage(
                            image: NetworkImage(product.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    right: 12,
                    top: 12,
                    child: GestureDetector(
                      onTap: () {
                        favourites.addToFavourites(product, context);
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          product.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.type,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text('MRP : ₹ ${product.price}')
            ],
          ),
        ),
      ),
    );
  }
}
