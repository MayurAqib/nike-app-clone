import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nike_app_clone/models/sub_category_model.dart';
import 'package:nike_app_clone/provider/sub_category_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_bar_action_icons.dart';
import '../../../../utils/product_overview_tile.dart';

class WeekHighLightsPage extends StatelessWidget {
  final SubCategoryModel subCategory;

  const WeekHighLightsPage({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    final subCategoryProvider = Provider.of<SubCategoryProvider>(context);
    final products =
        subCategoryProvider.weekHighlightsMenCategory(subCategory.category);

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
