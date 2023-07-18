import 'package:flutter/material.dart';
import 'package:nike_app_clone/pages/main_category/kids_category.dart';
import 'package:nike_app_clone/pages/main_category/men_category.dart';
import 'package:nike_app_clone/pages/main_category/women_category.dart';

import '../utils/app_bar_action_icons.dart';
import '../utils/my_drawer.dart';
import 'main_category/jordan.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Shop',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          actions: const [AppBarActionIcon()],
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              width: double.infinity,
              child: TabBar(
                  isScrollable: true,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  indicatorColor: Colors.black,
                  indicatorWeight: 1.5,
                  unselectedLabelColor: Colors.grey.shade500,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text('Men'),
                    ),
                    Text('Women'),
                    Text('Kids'),
                    Text('Jordan'),
                  ]),
            ),
            const Expanded(
              child: TabBarView(children: [
                MenCategory(),
                WomenCategory(),
                KidsCategory(),
                Jordan()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
