import 'package:flutter/material.dart';

import '../data/men/shop_by_collection_men.dart';
import '../data/men/split_image_men_list.dart';
import '../data/men/week_highlights_men_list.dart';
import '../models/product_model.dart';

class FilterFavouritesProvider extends ChangeNotifier {
  //todo: FAVOURITES LOGIC START HERE
  List<ProductModel> favouritesItems = [];

  void addToFavourites(ProductModel product, BuildContext context) {
    final existingProductIndex =
        favouritesItems.indexWhere((item) => item.name == product.name);

    if (existingProductIndex != -1) {
      product.isFavorite = false;
      favouritesItems.removeAt(existingProductIndex);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Removed to Favourites')));
    } else {
      product.isFavorite = true;
      favouritesItems.add(product);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Added to Favourites')));
    }

    notifyListeners();
  }
  //! FAVOURITES LOGIC ENDS HERE

  //todo: FILTER LOGICS START FROM HERE
  late List<ProductModel> allProducts;
  List<ProductModel> filteredProducts = [];
  List<ProductModel> emptyList = [];

  FilterFavouritesProvider() {
    allProducts = [
      ...sneakerOfTheWeekMenList,
      ...nikeByYouMenList,
      ...metconMenList,
      ...airMaxMenList,
      ...airForceOneMenList,
      ...pegasusMenList,
      ...runningMenList,
      ...trainingMenShoeList,
      ...sandalsSlidesMenList,
      ...newFeaturedMenList,
      ...shoeMenList,
      ...clothingMenList,
      ...accessoriesMenList
    ];
  }
  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts = emptyList;
    } else {
      filteredProducts = allProducts
          .where((prod) =>
              prod.name.toLowerCase().contains(query.toLowerCase()) ||
              prod.type.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
