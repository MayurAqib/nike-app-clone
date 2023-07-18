import 'package:flutter/material.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({
    super.key,
    required this.tileTitle,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
    required this.fourthText,
    required this.navigateTo,
  });
  final String tileTitle;
  final String firstText;
  final String secondText;
  final String thirdText;
  final String fourthText;
  final void Function() navigateTo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tileTitle,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              GestureDetector(
                onTap: navigateTo,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(23),
                          right: Radius.circular(23)),
                      border: Border.all(color: Colors.grey.shade400)),
                  child: const Center(
                    child: Text(
                      'Edit',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(firstText,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
          Text(secondText,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
          Text(thirdText,
              style: const TextStyle(color: Colors.grey, fontSize: 16)),
          Text(fourthText,
              style: const TextStyle(color: Colors.grey, fontSize: 16))
        ],
      ),
    );
  }
}
