import 'package:flutter/material.dart';
import 'package:nike_app_clone/pages/open_from_drawer/inbox.dart';

import '../pages/open_from_drawer/events_page.dart';
import '../pages/open_from_drawer/favourites_page.dart';
import '../pages/open_from_drawer/setting_page.dart';
import '../pages/orders_related/orders_page.dart';
import '../pages/search_page.dart';
import '../pages/tabs_page.dart';
import 'drawer_row.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Image.network(
              'https://cdn-icons-png.flaticon.com/128/3177/3177440.png',
              height: 80,
            ),
            const SizedBox(height: 10),
            const Text(
              'Muhammad Aqib',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            const DrawerRow(
                navigateTo: SearchPage(),
                title: 'Discover',
                iconData: Icons.search_rounded),
            const DrawerRow(
              navigateTo: TabsPage(),
              title: 'Shop',
              iconData: Icons.shop,
            ),
            const DrawerRow(
              navigateTo: EventsPage(),
              title: 'Events',
              iconData: Icons.event,
            ),
            const DrawerRow(
              navigateTo: OrdersPage(),
              title: 'Orders',
              iconData: Icons.wallet_giftcard_outlined,
            ),
            const DrawerRow(
                navigateTo: FavouritesPage(),
                title: 'Favourites',
                iconData: Icons.favorite_border),
            const DrawerRow(
                navigateTo: Inbox(), title: 'Inbox', iconData: Icons.message),
            const DrawerRow(
              navigateTo: SettingsPage(),
              title: 'Settings',
              iconData: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}
