import 'package:flutter/material.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 1.h,
          ),
          RichText(
            text:TextSpan(
              children: [
                TextSpan(
                  text: "Your Card Is ",
                  style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold
                  )
                ),
                TextSpan(
                  text: "Empty",
                  style: TextStyle(
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold
                  )
                ),
              ]
            )
             ),
             SizedBox(
            height: 0.5.h,
          ),
          TextUtils(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize:15.sp ,
            fontWeight: FontWeight.bold,
            text: "Add items To Get Started",
            underLine: TextDecoration.none,
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 8.h,
            width: 70.w,
            child: ElevatedButton(
              onPressed: (){
                Get.toNamed(Routes.MainScreen);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                elevation: 0
              ),
            child: TextUtils(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize:15.sp ,
            fontWeight: FontWeight.bold,
            text: "Go to Home",
            underLine: TextDecoration.none,
          ),
            ),
          )
        ],
      ),
    );
  }
}
