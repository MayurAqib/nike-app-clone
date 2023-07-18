import 'package:flutter/material.dart';
import 'package:nike_app_clone/pages/orders_related/shipping_page.dart';
import 'package:nike_app_clone/utils/check_box.dart';
import 'package:nike_app_clone/utils/text_tile.dart';
import 'package:provider/provider.dart';

import '../../provider/orders_provider.dart';
import '../../utils/headline.dart';
import '../../utils/information_message.dart';
import '../../utils/my_button.dart';
import '../../utils/my_textformfield.dart';
import '../../utils/order_appbar.dart';
import '../../utils/order_summary.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrdersProvider>(context);
    return Scaffold(
        backgroundColor: order.orderPageColor,
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
                          const SizedBox(
                            height: 70,
                          ),
                          const Headline(
                              headline: 'Enter your name and address:'),
                          const SizedBox(height: 30),
                          MyTextFormField(
                            controller: firstNameController,
                            label: 'First Name',
                            validator: (p0) {
                              return 'Okay';
                            },
                          ),
                          const SizedBox(height: 20),
                          MyTextFormField(
                            controller: lastNameController,
                            label: 'Last Name',
                            validator: (p0) {
                              return 'Okay';
                            },
                          ),
                          const SizedBox(height: 20),
                          MyTextFormField(
                            controller: addressController,
                            label: 'Address',
                            validator: (p0) {
                              return 'Okay';
                            },
                          ),
                          const SizedBox(height: 20),
                          MyTextFormField(
                            controller: postalCodeController,
                            label: 'Postal Code',
                            validator: (p0) {
                              return 'Okay';
                            },
                          ),
                          const SizedBox(height: 20),
                          MyTextFormField(
                            controller: cityController,
                            label: 'City',
                            validator: (p0) {
                              return 'Okay';
                            },
                          ),
                          const SizedBox(height: 20),
                          MyTextFormField(
                            controller: stateController,
                            label: 'State',
                            validator: (p0) {
                              return 'Okay';
                            },
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'India',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const Headline(
                              headline: 'What\'s your contact information?'),
                          const SizedBox(height: 20),
                          MyTextFormField(
                            controller: emailController,
                            label: 'Email',
                            validator: (p0) {
                              return 'hello';
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, bottom: 10),
                            child: InformationMessage(
                                text:
                                    'A confirmation email will be sent after checkout.'),
                          ),
                          MyTextFormField(
                            controller: phoneNumberController,
                            label: 'Phone Number',
                            validator: (p0) {
                              return 'hello';
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, bottom: 50),
                            child: InformationMessage(
                                text:
                                    'A carrier might contact you to confirm delivery.'),
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckBox(),
                              SizedBox(
                                width: 10,
                              ),
                              InformationMessage(
                                  text:
                                      'I have read and consent to eShopWorld processing my information in accordance with the Privacy Policy and Cookie Policy. eShopWorld is a trusted Nike partner.')
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MyButton(
                              title: 'Continue to Delivery',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ShippingPage()));
                              }),
                          const BottomTextTile(text: 'Delivery'),
                          const BottomTextTile(
                            text: 'Shipping',
                            textColor: Colors.grey,
                          ),
                          const BottomTextTile(
                            text: 'Billing',
                            textColor: Colors.grey,
                          ),
                          const BottomTextTile(
                            text: 'Payment',
                            textColor: Colors.grey,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
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
        ));
  }
}
