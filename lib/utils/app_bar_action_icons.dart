import 'package:flutter/material.dart';
import 'package:nike_app_clone/utils/cart_icon.dart';

import '../pages/search_page.dart';

class AppBarActionIcon extends StatelessWidget {
  const AppBarActionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchPage()));
          },
          child: Image.network(
            'https://cdn-icons-png.flaticon.com/128/709/709592.png',
            height: 25,
          ),
        ),
        const CartIcon()
      ],
    );
  }
}
