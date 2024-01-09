// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/Card/Card_Total.dart';
import 'package:flutter_e_commers/view/Widgets/Card/Cart_Product_card.dart';
import 'package:flutter_e_commers/view/Widgets/Card/empty_card.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            title: const Text("Card Items"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.ClearAllProduct();
                  },
                  icon: const Icon(Icons.backspace))
            ],
          ),
          body: Obx(() {
            if (controller.ProductsMap.isEmpty) {
              return EmptyCard();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 79.h,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductcard(
                              productModels:
                                  controller.ProductsMap.keys.toList()[index],
                              index: index,
                              Counter:
                                  controller.ProductsMap.values.toList()[index],
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 0.h,
                              ),
                          itemCount: controller.ProductsMap.length),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: CardTotal(),
                    )
                  ],
                ),
              );
            }
          })),
    );
  }
}
