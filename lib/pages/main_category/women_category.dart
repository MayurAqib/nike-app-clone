import 'package:flutter/material.dart';
import 'package:nike_app_clone/provider/sub_category_provider.dart';
import 'package:nike_app_clone/utils/sub_category_tile.dart';
import 'package:provider/provider.dart';

import '../../utils/headline.dart';
import '../../utils/split_image_tile.dart';
import 'sub_category_pages/men/shop_by_collection_men_page.dart';
import 'sub_category_pages/men/week_highlights_men_page.dart';

class WomenCategory extends StatelessWidget {
  const WomenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final subCategoryProvider = Provider.of<SubCategoryProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Headline(headline: 'This Week\'s Highlights'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        subCategoryProvider.weekHighLightsMenSectionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final subCategory = subCategoryProvider
                          .weekHighLightsMenSectionList[index];
                      return SubCategoryTile(
                        subCategory: subCategory,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WeekHighLightsPage(subCategory: subCategory),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Container(
            height: 600,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/16964449/pexels-photo-16964449/free-photo-of-standing-woman-holding-hand-on-skateboard.jpeg?auto=compress&cs=tinysrgb&w=600'),
                    fit: BoxFit.cover)),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subCategoryProvider.splitImageMenSectionList.length,
              itemBuilder: (BuildContext context, int index) {
                final subCategory =
                    subCategoryProvider.splitImageMenSectionList[index];
                return SplitImageTile(subCategory: subCategory);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Headline(headline: 'Shop By Collection'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subCategoryProvider
                        .shopByCollectionMenSectionList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final subCategory = subCategoryProvider
                          .shopByCollectionMenSectionList[index];
                      return SubCategoryTile(
                        subCategory: subCategory,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopByCollectionPage(
                                  subCategory: subCategory),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
