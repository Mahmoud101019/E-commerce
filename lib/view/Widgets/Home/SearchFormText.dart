// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Product_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({super.key});

  final controller = Get.find<ProdcutController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdcutController>(builder: (_) {
      return TextField(
        controller: controller.SearchTextController,
        cursorColor: Colors.black,
        onChanged: (SearchName) {
          controller.addSearchToList(SearchName);
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefix: Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: controller.SearchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.ClearSearch();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ))
              : null,
          hintText: "Serach Your looking For",
          hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
      );
    });
  }
}
