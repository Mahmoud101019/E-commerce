// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardTotal extends StatelessWidget {
  CardTotal({super.key});
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          children: [
            Column(
              children: [
                TextUtils(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  text: "Total",
                  underLine: TextDecoration.none,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextUtils(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  text: "\$${controller.total}",
                  underLine: TextDecoration.none,
                ),
              ],
            ),
            SizedBox(
              width: 2.h,
            ),
            Expanded(
              child: SizedBox(
                height: 8.h,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                        elevation: 0),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          text: "Chack Out",
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Icon(Icons.shopping_cart)
                      ],
                    )),
              ),
            )
          ],
        ),
      );
    });
  }
}
