// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/Logic/controllers/category_controller.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/Category/category_items.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';

class CategoryWidgetScreen extends StatelessWidget {
  CategoryWidgetScreen({super.key});

  final Controller = Get.find<Categorycontroller>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (Controller.IsCategoryloading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Controller.getCategoryIndex(index);
                    Get.to(() => CategoryItemsScreen(
                      CategoryTitle: Controller.CategoryNameList[index],
                    ));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                (
                                  Controller.imageCategory[index]
                                )),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: TextUtils(
                          color: Get.isDarkMode ? Colors.white : Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          text: Controller.CategoryNameList[index],
                          underLine: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: Controller.CategoryNameList.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
            ),
          );
        }
      },
    );
  }
}
