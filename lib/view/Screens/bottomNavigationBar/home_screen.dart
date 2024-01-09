// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/Home/CardItems.dart';
import 'package:flutter_e_commers/view/Widgets/Home/SearchFormText.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? darkGreyClr : mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        text: "Find Your",
                        color: Colors.white,
                        underLine: TextDecoration.none),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextUtils(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        text: "Inspiration",
                        color: Colors.white,
                        underLine: TextDecoration.none),
                    SizedBox(
                      height: 4.5.h,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    text: "Items",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
