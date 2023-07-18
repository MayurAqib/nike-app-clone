import 'package:flutter/material.dart';
import 'package:nike_app_clone/models/sub_category_model.dart';
import 'package:nike_app_clone/pages/main_category/sub_category_pages/men/split_image_men_page.dart';

class SplitImageTile extends StatelessWidget {
  const SplitImageTile({super.key, required this.subCategory});
  final SubCategoryModel subCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SplitImageMenPage(subCategory: subCategory)));
      },
      child: Container(
        alignment: const Alignment(-1, 0),
        height: 150,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.white, width: 5))),
        child: Text(
          '     ${subCategory.category}',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
