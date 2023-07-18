import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/cart_model.dart';

class CartTile extends StatelessWidget {
  const CartTile(
      {super.key,
      required this.cart,
      required this.onFavourite,
      required this.isFavourite,
      required this.onDelete,
      required this.isDelete});
  final void Function() onFavourite;
  final void Function() onDelete;
  final CartModel cart;
  final bool isFavourite;
  final bool isDelete;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: onFavourite,
                  child: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    size: 35,
                  )),
              const SizedBox(width: 15),
              GestureDetector(
                  onTap: onDelete,
                  child: Icon(
                    isDelete ? Icons.delete : Icons.delete_outline_rounded,
                    size: 35,
                  )),
            ],
          ),
        )
      ]),
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 15),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110,
                  width: 100,
                  child: Image.network(
                    cart.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.product.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      cart.product.type,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Price per item: MRP : ₹ ${cart.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Qty: ${cart.quantity}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'MRP : ₹ ${cart.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Incl. of taxes',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text('(Also included all applicable duties)',
                            style: TextStyle(color: Colors.grey))
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
