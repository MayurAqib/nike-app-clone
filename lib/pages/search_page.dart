import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../provider/filter_and_favorites_provider.dart';
import '../utils/product_overview_tile.dart';
import '../utils/search_textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<FilterFavouritesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 60),
                child: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchTextfield(
                      focusNode: _searchFocusNode,
                      onChanged: (value) {
                        products.searchProducts(value);
                      },
                    ),
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 2.5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SingleChildScrollView(
              child: MasonryGridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: products.filteredProducts.length,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductOverViewTile(
                      product: products.filteredProducts[index]);
                },
              ),
            )),
          ],
        );
      }),
    );
  }
}
