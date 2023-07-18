import 'package:flutter/material.dart';
import 'package:nike_app_clone/models/sub_category_model.dart';

class SubCategoryTile extends StatelessWidget {
  const SubCategoryTile(
      {super.key, required this.subCategory, required this.onTap});
  final SubCategoryModel subCategory;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170,
                height: 170,
                child: Image.network(
                  subCategory.imageurl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                child: Text(
                  subCategory.category,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
