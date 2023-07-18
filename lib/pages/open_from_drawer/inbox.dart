import 'package:flutter/material.dart';
import 'package:nike_app_clone/utils/cart_icon.dart';
import 'package:nike_app_clone/utils/my_drawer.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Inbox'),
        actions: [CartIcon()],
      ),
      drawer: const MyDrawer(),
      body: Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1649879681760-c08f5d26ee09?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fG5pa2UlMjBtb2RlbHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome to the Nike App',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Thanks for joining Us as a\nMember in  the Nike App.\nLet\'s get you started',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '13 minutes ago',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
