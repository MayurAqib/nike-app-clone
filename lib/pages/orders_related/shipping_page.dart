import 'package:flutter/material.dart';
import 'package:nike_app_clone/pages/orders_related/billing_page.dart';
import 'package:nike_app_clone/provider/cart_provider.dart';
import 'package:nike_app_clone/utils/cart_items_image.dart';
import 'package:nike_app_clone/utils/delivery_tile.dart';
import 'package:nike_app_clone/utils/my_button.dart';
import 'package:nike_app_clone/utils/order_appbar.dart';
import 'package:nike_app_clone/utils/text_tile.dart';
import 'package:provider/provider.dart';
import '../../utils/headline.dart';
import '../../utils/order_summary.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OrderAppbar(),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 70),
                      const Headline(
                          headline: 'When would you like to get your order?'),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 30),
                        margin: const EdgeInsets.only(top: 20, bottom: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Arrives Fri, 21 July-Tue, 1 Aug',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text('Free')
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Arrives Fri, 21 July-Tue, 1 Aug',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cartProvider.cartItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartItemsImage(
                                cartModel: cartProvider.cartItems[index]);
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      MyButton(
                          title: 'Continue to Billing',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BillingPage()));
                          }),
                      DeliveryTile(
                          navigateTo: () {},
                          tileTitle: 'Delivery',
                          firstText: 'Muhammad Aqib',
                          secondText: 'vpo jaroda',
                          thirdText: 'codewithaaqib@gmail.com',
                          fourthText: '9756355982'),
                      const BottomTextTile(text: 'Shipping'),
                      const BottomTextTile(
                        text: 'Billing',
                        textColor: Colors.grey,
                      ),
                      const BottomTextTile(
                        text: 'Payment',
                        textColor: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    top: 0, left: 0, right: 0, child: OrderSummary())
              ],
            )
          ],
        ),
      )),
    );
  }
}
