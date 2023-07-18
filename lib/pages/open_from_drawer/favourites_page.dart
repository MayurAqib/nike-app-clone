import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nike_app_clone/pages/tabs_page.dart';
import 'package:nike_app_clone/utils/my_button.dart';
import 'package:nike_app_clone/utils/my_drawer.dart';
import 'package:provider/provider.dart';

import '../../provider/filter_and_favorites_provider.dart';
import '../../utils/app_bar_action_icons.dart';
import '../../utils/product_overview_tile.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favourites = Provider.of<FilterFavouritesProvider>(context);
    Widget widget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5)),
              child: const Icon(
                Icons.favorite_border,
                size: 27,
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Items added to your Favourites\nwill be saved here.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
    if (favourites.favouritesItems.isNotEmpty) {
      widget = MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: favourites.favouritesItems.length,
        itemBuilder: (context, index) {
          final product = favourites.favouritesItems[index];
          return ProductOverViewTile(product: product);
        },
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Favourites'),
          actions: const [AppBarActionIcon()],
        ),
        drawer: const MyDrawer(),
        body: widget,
        bottomNavigationBar: favourites.favouritesItems.isEmpty
            ? Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: MyButton(
                    title: 'Shop Now',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TabsPage()));
                    }),
              )
            : null);
  }
}
