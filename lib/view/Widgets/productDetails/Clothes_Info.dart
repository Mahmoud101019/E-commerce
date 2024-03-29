// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Product_controller.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfoScreen extends StatelessWidget {
  final String title;
  final int ProId;
  final double rate;
  final String description;
  ClothesInfoScreen(
      {required this.title,
      Key? key,
      required this.ProId,
      required this.rate,
      required this.description})
      : super(key: key);

  final ProController = Get.find<ProdcutController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(() {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      ProController.managefavourit(ProId);
                    },
                    child: ProController.Isfavourit(ProId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                );
              })
            ],
          ),
          Row(
            children: [
              TextUtils(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                text: "$rate",
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 2,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
