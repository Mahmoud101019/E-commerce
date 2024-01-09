// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/auth_controller.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:get/get.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:sizer/sizer.dart';

class CheckWidget extends StatelessWidget {
  final Conctroller = Get.find<AuthController>();

  CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              Conctroller.Checkbox();
            },
            child: Container(
                height: 5.h,
                width: 9.w,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Conctroller.isCheckbox
                    ? Get.isDarkMode
                        ? const Icon(
                            Icons.done,
                            color: pinkClr,
                            size: 30,
                          )
                        : Image.asset("assets/images/check.png")
                    : Container()),
          ),
          SizedBox(
            width: 5.w,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  text: "i accept",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                width: 2.w,
              ),
              TextUtils(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  text: "terms & conditions",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.underline),
            ],
          )
        ],
      );
    });
  }
}
