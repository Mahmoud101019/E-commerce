// ignore_for_file: deprecated_member_use, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/Logic/controllers/Product_controller.dart';
import 'package:flutter_e_commers/Logic/controllers/category_controller.dart';
import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Screens/product_details_scree.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CategoryItemsScreen extends StatelessWidget {
  final String CategoryTitle;
  CategoryItemsScreen({super.key , required this.CategoryTitle});

  final controller = Get.find<ProdcutController>();

  final cartController = Get.find<CartController>();

  final CatController = Get.find<Categorycontroller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(CategoryTitle),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(() {
          if (CatController.IsAllCategoryloading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            );
          } else {
            return GridView.builder(
              itemCount: CatController.categorylist.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return BuildcardItems(
                    img: CatController.categorylist[index].image,
                    Price: CatController.categorylist[index].price,
                    Rate: CatController.categorylist[index].rating.rate,
                    Productid: CatController.categorylist[index].id,
                    productModels: CatController.categorylist[index],
                    onTap: () {
                      Get.to(() => ProductDetailsScree(
                            productModels: CatController.categorylist[index],
                          ));
                    });
              },
            );
          }
        })
        // Obx(
        //   () {
        //     if (CatController.IsCategoryloading.value) {
        //       return Center(
        //         child: CircularProgressIndicator(
        //           color: Get.isDarkMode ? pinkClr : mainColor,
        //         ),
        //       );
        //     } else {
        //       GridView.builder(
        //         shrinkWrap: true,
        //         itemCount: controller.prodcutLiist.length,
        //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //           childAspectRatio: 0.8,
        //           mainAxisSpacing: 9.0,
        //           crossAxisSpacing: 6,
        //           maxCrossAxisExtent: 200,
        //         ),
        //         itemBuilder: (context, index) {
        //           return BuildcardItems(
        //               img: controller.prodcutLiist[index].image,
        //               Price: controller.prodcutLiist[index].price,
        //               Rate: controller.prodcutLiist[index].rating.rate,
        //               Productid: controller.prodcutLiist[index].id,
        //               productModels: controller.prodcutLiist[index],
        //               onTap: () {
        //                 Get.to(() => ProductDetailsScree(
        //                       productModels: controller.prodcutLiist[index],
        //                     ));
        //               });
        //         },
        //       );
        //     }
        //   },
        // ));
        );
  }
}

Widget BuildcardItems({
  required String img,
  required double Price,
  required double Rate,
  required int Productid,
  required ProductModels productModels,
  required Function() onTap,
}) {
  final Productcontroller = Get.find<ProdcutController>();
  final cartcontroller = Get.find<CartController>();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.5.h),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              )
            ]),
        child: Column(
          children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Productcontroller.managefavourit(Productid);
                      },
                      icon: Productcontroller.Isfavourit(Productid)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            )),
                  IconButton(
                      onPressed: () {
                        cartcontroller.addProductToCard(productModels);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ))
                ],
              );
            }),
            Container(
              width: double.infinity.w,
              height: 12.h,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                img,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      text: "\$ $Price",
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  Container(
                    height: 2.7.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              text: "$Rate",
                              color: Colors.white,
                              underLine: TextDecoration.none),
                          Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
