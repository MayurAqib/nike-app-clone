import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nike_app_clone/models/sub_category_model.dart';
import 'package:provider/provider.dart';

import '../../../../provider/sub_category_provider.dart';
import '../../../../utils/app_bar_action_icons.dart';
import '../../../../utils/product_overview_tile.dart';

class SplitImageMenPage extends StatelessWidget {
  const SplitImageMenPage({super.key, required this.subCategory});
  final SubCategoryModel subCategory;
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<SubCategoryProvider>(context);
    final products =
        categoryProvider.splitImageMenCategory(subCategory.category);

    return Scaffold(
      appBar: AppBar(
        title: Text(subCategory.category),
        actions: const [AppBarActionIcon()],
      ),
      body: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return ProductOverViewTile(product: product);
        },
      ),
    );
  }
}
