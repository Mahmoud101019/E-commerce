// ignore_for_file: prefer_const_constructors, unused_import, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Product_controller.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final controller = Get.find<ProdcutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favouritLiest.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25.h,
                width: 100.w,
                child: Image.asset("assets/images/heart.png"),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextUtils(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                text: "Please Add Your Favorites Products",
                underLine: TextDecoration.none,
              )
            ],
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildfavorititem(
                    img: controller.favouritLiest[index].image,
                    price: controller.favouritLiest[index].price,
                    title: controller.favouritLiest[index].title,
                    Productid: controller.favouritLiest[index].id);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 2,
                );
              },
              itemCount: controller.favouritLiest.length);
        }
      }),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         height: 25.h,
      //         width: 100.w,
      //         child: Image.asset("assets/images/heart.png"),
      //       ),
      //       SizedBox(
      //         height: 3.h,
      //       ),
      //       TextUtils(
      //         color: Colors.black,
      //         fontSize: 15.sp,
      //         fontWeight: FontWeight.bold,
      //         text: "Please Add Your Favorites Products",
      //         underLine: TextDecoration.none,
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  Widget buildfavorititem({
    required String img,
    required double price,
    required String title,
    required int Productid,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
      child: SizedBox(
        width: double.infinity.w,
        height: 20.h,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    img,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  controller.managefavourit(Productid);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
