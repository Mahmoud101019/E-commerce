import 'package:flutter/material.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "assets/images/background.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 10.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: TextUtils(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          text: "Welcome",
                          color: Colors.white,
                          underLine: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 10.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            text: "M&N",
                            color: mainColor,
                            underLine: TextDecoration.underline),
                        SizedBox(
                          width: 2.h,
                        ),
                        TextUtils(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            text: "Store",
                            color: Colors.white,
                            underLine: TextDecoration.none)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.LoginScreen);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 2.h)),
                    child: TextUtils(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        text: "Get Start",
                        color: Colors.white,
                        underLine: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal,
                          text: "Don't Have Account?",
                          color: Colors.white,
                          underLine: TextDecoration.none),
                      SizedBox(
                        width: 0.1.w,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.offNamed(Routes.SignupScreen);
                          },
                          child: TextUtils(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              text: "Sign Up",
                              color: Colors.white,
                              underLine: TextDecoration.underline))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
