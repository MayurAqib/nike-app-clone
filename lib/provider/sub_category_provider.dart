import 'package:flutter/cupertino.dart';
import 'package:nike_app_clone/models/sub_category_model.dart';

import '../data/men/shop_by_collection_men.dart';
import '../data/men/split_image_men_list.dart';
import '../data/men/sub_category_men_list.dart';
import '../data/men/week_highlights_men_list.dart';
import '../models/product_model.dart';

class SubCategoryProvider extends ChangeNotifier {
  List<SubCategoryModel> get weekHighLightsMenSectionList {
    return weekHighLightsMenSection;
  }

  List<SubCategoryModel> get shopByCollectionMenSectionList {
    return shopByCollectionMenSection;
  }

  List<SubCategoryModel> get splitImageMenSectionList {
    return splitImageMenSection;
  }

  //! WEEKLYHIGHLIGHTS MEN
  List<ProductModel> weekHighlightsMenCategory(String category) {
    switch (category) {
      case 'Sneaker of the Week':
        return sneakerOfTheWeekMenList;
      case 'Nike By You':
        return nikeByYouMenList;
      case 'Metcon':
        return metconMenList;
      case 'Air Max':
        return airMaxMenList;
      default:
        return [];
    }
  }

//! SHOP BY Collection MEN
  List<ProductModel> shopByCollectionMenCategory(String category) {
    switch (category) {
      case 'Air Force 1':
        return airForceOneMenList;
      case 'Pegasus':
        return pegasusMenList;
      case 'Running':
        return runningMenList;
      case 'Sandals and Slides':
        return sandalsSlidesMenList;
      case 'Training':
        return trainingMenShoeList;
      default:
        return [];
    }
  }

  //! SPLIT IMAGE MEN
  List<ProductModel> splitImageMenCategory(String category) {
    switch (category) {
      case 'New & Featured':
        return newFeaturedMenList;
      case 'Shoes':
        return shoeMenList;
      case 'Clothing':
        return clothingMenList;
      case 'Accessories':
        return accessoriesMenList;
      default:
        return [];
    }
  }
}
