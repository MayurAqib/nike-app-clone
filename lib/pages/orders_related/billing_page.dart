import 'package:flutter/material.dart';
import 'package:nike_app_clone/pages/orders_related/payment_page.dart';
import 'package:nike_app_clone/pages/orders_related/shipping_page.dart';
import 'package:nike_app_clone/utils/check_box.dart';
import 'package:nike_app_clone/utils/order_appbar.dart';
import '../../utils/delivery_tile.dart';
import '../../utils/headline.dart';
import '../../utils/my_button.dart';
import '../../utils/order_summary.dart';
import 'delivery_page.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        const Headline(
                            headline: 'What\'s your billing address?'),
                        SizedBox(
                          height: 30,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CheckBox(),
                            Text('    Billing matches shipping address')
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        MyButton(
                            title: 'Continue to Payment',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentPage()));
                            }),
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
                                      builder: (context) =>
                                          const DeliveryPage()));
                            }),
                        DeliveryTile(
                            tileTitle: 'Shipping',
                            firstText: 'Free',
                            secondText: '',
                            thirdText: 'Shipment One',
                            fourthText: 'Arrives Fri, 21 July-Tue, 1 Aug',
                            navigateTo: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ShippingPage()));
                            }),
                      ],
                    ),
                  ),
                  const Positioned(
                      top: 0, left: 0, right: 0, child: OrderSummary())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
