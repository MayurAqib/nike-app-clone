import 'package:flutter/material.dart';

import '../pages/cart_page.dart';
import '../utils/my_button.dart';

class OrdersProvider extends ChangeNotifier {
  bool visibility = false;

  //! EXIT FROM ORDERS BACK TO CARTPAGE
  void leavingCheckout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: AlertDialog(
                backgroundColor: Colors.white,
                shadowColor: Colors.transparent,
                content: SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      const Text(
                        'Leaving Checkout',
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                          'Your checkout session will be lost. Do you want to leave checkout?'),
                      const SizedBox(height: 30),
                      MyButton(
                          title: 'Leave Checkout',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartPage(),
                                ));
                          }),
                      const SizedBox(height: 10),
                      MyButton(
                          title: 'Resume Checkout',
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ),
            ));
  }

  //! VISIBILITY OF ORDER SUMMARY
  Color orderPageColor = Colors.white;
  bool summaryVisibility() {
    visibility = !visibility;
    if (visibility == true) {
      orderPageColor = Colors.grey.shade300;
    } else {
      orderPageColor = Colors.white;
    }
    notifyListeners();

    return visibility;
  }

  //! CHECKBOX CONDITIONS
  bool isChecked = false;
  bool get isCheckedBox {
    isChecked = !isChecked;
    notifyListeners();
    return isChecked;
  }
}
