// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/auth_controller.dart';
import 'package:flutter_e_commers/utils/my_string.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/auth/auth_button.dart';
import 'package:flutter_e_commers/view/Widgets/auth/auth_text_from_field.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';

class ForgetpasswordScreen extends StatelessWidget {
  ForgetpasswordScreen({super.key});

  final Formkey = GlobalKey<FormState>();
  final TextEditingController EmailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          title: TextUtils(
              text: "Forget Password",
              color: Get.isDarkMode ? pinkClr : Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              )),
          elevation: 0,
        ),
        body: Form(
            key: Formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        text:
                            "if you want to recover your account then please provide your email ID below..",
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        underLine: TextDecoration.none),
                    const SizedBox(
                      height: 35,
                    ),
                    Image.asset(
                      "assets/images/forgetpass copy.png",
                      width: 250,
                    ),
                    const SizedBox(
                      height: 35,
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
                          ? const Icon(
                              Icons.email,
                              size: 30,
                              color: Colors.pink,
                            )
                          : Image.asset("assets/images/email.png"),
                      suffixIcon: const Text(""),
                      hintText: "Email",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return AuthButton(
                        onPressed: () {
                          if (Formkey.currentState!.validate()) {
                            String emil = EmailController.text.trim();
                            controller.resetpassword(emil);
                          }
                        },
                        text: "SEND",
                      );
                    }),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
