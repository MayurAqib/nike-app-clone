import 'package:flutter/material.dart';
import 'package:nike_app_clone/pages/orders_related/delivery_page.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';
import '../../provider/orders_provider.dart';
import '../../utils/delivery_tile.dart';
import '../../utils/headline.dart';
import '../../utils/information_message.dart';
import '../../utils/my_button.dart';
import '../../utils/my_textformfield.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final promoController = TextEditingController();
  final nameOnCardController = TextEditingController();
  final cardNumberController = TextEditingController();
  final dateOnCardController = TextEditingController();
  final cardCVVController = TextEditingController();
  @override
  void dispose() {
    promoController.dispose();
    nameOnCardController.dispose();
    cardNumberController.dispose();
    dateOnCardController.dispose();
    cardCVVController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrdersProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(
            'https://cdn-icons-png.flaticon.com/128/732/732084.png',
            height: 25),
        actions: [
          GestureDetector(
              onTap: () {
                order.leavingCheckout(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.shopping_bag_outlined),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey.shade300),
                    bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Summary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                          '₹ ${cart.totalCartPrice} (${cart.cartItems.length} items)'),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_drop_down))
                    ],
                  )
                ],
              ),
            ),
            const Headline(headline: 'Have a promo code?'),
            MyTextFormField(
              controller: promoController,
              label: 'Promo',
              validator: (p0) {
                return 'hi';
              },
            ),
            const SizedBox(height: 40),
            const Headline(headline: 'How would you like to pay?'),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2)),
              child: const Row(
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 25,
                  ),
                  Text('  Credit or Debit Card')
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Headline(headline: 'Enter your payment details'),
            const SizedBox(
              height: 20,
            ),
            MyTextFormField(
              controller: nameOnCardController,
              label: 'Name on card',
              validator: (p0) {
                return '';
              },
            ),
            MyTextFormField(
              controller: cardNumberController,
              label: 'Card number',
              validator: (p0) {
                return '';
              },
            ),
            MyTextFormField(
              controller: dateOnCardController,
              label: 'MM/YY',
              validator: (p0) {
                return '';
              },
            ),
            MyTextFormField(
              controller: cardCVVController,
              label: 'CVV',
              validator: (p0) {
                return '';
              },
            ),
            const SizedBox(height: 40),
            const InformationMessage(
                text:
                    'By clicking Place Order, you agree to the eShopWorld Terms and Condition.'),
            MyButton(title: 'Place Order', onTap: () {}),
            DeliveryTile(
                tileTitle: 'Delivery',
                firstText: 'Muhammad Aqib',
                secondText: 'vpo jaroda',
                thirdText: 'codwwithaaqib@gmaail.com',
                fourthText: '9756355982',
                navigateTo: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DeliveryPage()));
                }),
          ],
        ),
      ),
    );
  }
}
