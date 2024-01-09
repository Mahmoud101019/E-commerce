// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors, unused_import, avoid_print, unused_local_variable, deprecated_member_use
import 'dart:math';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/auth_controller.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/my_string.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/auth/Check_widget.dart';
import 'package:flutter_e_commers/view/Widgets/auth/auth_button.dart';
import 'package:flutter_e_commers/view/Widgets/auth/auth_text_from_field.dart';
import 'package:flutter_e_commers/view/Widgets/auth/container_under.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final Formkey = GlobalKey<FormState>();

  final TextEditingController NameController = TextEditingController();
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
                              text: "Sign",
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none),
                          const SizedBox(
                            width: 10,
                          ),
                          TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "Up",
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none)
                        ]),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFromField(
                          controller: NameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return "Enter Valid Name";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.pink,
                                )
                              : Image.asset("assets/images/user.png"),
                          suffixIcon: const Text(""),
                          hintText: "User Name",
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
                        const SizedBox(
                          height: 20,
                        ),
                        CheckWidget(),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (controller.isCheckbox == false) {
                                  Get.snackbar(
                                    "Error!",
                                    "Please Checkbox",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.white,
                                    colorText: Colors.black,
                                    duration: const Duration(seconds: 5),
                                  );
                                } else if (Formkey.currentState!.validate()) {
                                  String name = NameController.text.trim();
                                  String Emil = EmailController.text.trim();
                                  String password =
                                      PasswordController.text.trim();

                                  controller.SignupFirbase(
                                      Name: name,
                                      Email: Emil,
                                      Password: password);
                                  controller.isCheckbox == true;
                                }
                              },
                              text: "SIGN UP",
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ContainerUnder(
                Text1: "Already have an account?",
                Text2: "LogIn",
                onPressed: () {
                  Get.offNamed(Routes.LoginScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
