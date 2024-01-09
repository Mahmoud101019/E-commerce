// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:sizer/sizer.dart';

class ContainerUnder extends StatelessWidget {
  final String Text1;
  final String Text2;
  final Function() onPressed;

  const ContainerUnder(
      {super.key,
      required this.Text1,
      required this.Text2,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20.h,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? pinkClr : mainColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextUtils(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              text: Text1,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: TextUtils(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  text: Text2,
                  color: Colors.white,
                  underLine: TextDecoration.none))
        ]),
      ),
    );
  }
}