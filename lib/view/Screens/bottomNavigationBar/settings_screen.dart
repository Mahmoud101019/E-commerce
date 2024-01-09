// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Theme_controller.dart';
import 'package:flutter_e_commers/Logic/controllers/auth_controller.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  Themcontroller().ChangesTheme();
                },
                child: TextUtils(
                  text: "Darkmode",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                )
                ),
          ),
          GetBuilder<AuthController>(
            builder: (controller) {
              return TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Logout From App",
                        titleStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        middleText: "Are you sure yo need to logout",
                        middleTextStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        backgroundColor: Colors.grey,
                        radius: 10,
                        textCancel: "No",
                        cancelTextColor: Colors.white,
                        textConfirm: "Yes",
                        confirmTextColor: Colors.white,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {
                          controller.SignoutFromApp();
                        },
                        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
                  },
                  child: TextUtils(
                    text: "LogOut",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ));
            },
          ),
        ],
      ),
    );
  }
}