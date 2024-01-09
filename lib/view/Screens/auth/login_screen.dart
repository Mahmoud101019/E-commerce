// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors, unused_import, deprecated_member_use
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/auth_controller.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/my_string.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/auth/Check_widget.dart';
import 'package:flutter_e_commers/view/Widgets/auth/auth_button.dart';
import 'package:flutter_e_commers/view/Widgets/auth/auth_text_from_field.dart';
import 'package:flutter_e_commers/view/Widgets/auth/container_under.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final Formkey = GlobalKey<FormState>();

  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: Formkey,
                    child: Column(
                      children: [
                        Row(children: [
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "Log",
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none),
                          const SizedBox(
                            width: 10,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "In",
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none)
                        ]),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFromField(
                          controller: EmailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "inValed Mail";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.email,
                                  size: 30,
                                  color: Colors.pink,
                                )
                              : Image.asset("assets/images/email.png"),
                          suffixIcon: const Text(""),
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFromField(
                            controller: PasswordController,
                            obscureText: controller.isVisibilty ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "inValed Password";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.pink,
                                  )
                                : Image.asset("assets/images/lock.png"),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.Visibilty();
                              },
                              icon: controller.isVisibilty
                                  ? Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                            ),
                            hintText: "Password",
                          );
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.ForgetpasswordScreen);
                              },
                              child: TextUtils(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  text: "Forget Password ?",
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  underLine: TextDecoration.none)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (Formkey.currentState!.validate()) {
                                String Emil = EmailController.text.trim();
                                String Password =
                                    PasswordController.text.trim();
                                controller.logInUsingFirebase(
                                    email: Emil, password: Password);
                              }
                            },
                            text: "LOG IN",
                          );
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        TextUtils(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            text: "OR",
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underLine: TextDecoration.none),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {},
                                child:
                                    Image.asset("assets/images/facebook.png")),
                            const SizedBox(
                              width: 15,
                            ),
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                  onTap: () {
                                    controller.googlesignupApp();
                                  },
                                  child:
                                      Image.asset("assets/images/google.png"));
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ContainerUnder(
                Text1: "Don't Have Account",
                Text2: "SIGN UP",
                onPressed: () {
                  Get.offNamed(Routes.SignupScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
