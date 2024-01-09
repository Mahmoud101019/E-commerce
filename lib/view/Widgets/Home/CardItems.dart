// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/Logic/controllers/Product_controller.dart';
import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Screens/product_details_scree.dart';
import 'package:flutter_e_commers/view/Widgets/text_utils.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});

  final controller = Get.find<ProdcutController>();

  final carttcontroller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.Isloading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: controller.SearchList.isEmpty &&
                  controller.SearchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset("assets/images/search_empty_dark.png")
                  : Image.asset("assets/images/search_empry_light.png")
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.SearchList.isEmpty
                      ? controller.prodcutLiist.length
                      : controller.SearchList.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    if (controller.SearchList.isEmpty) {
                      return BuildcardItems(
                          img: controller.prodcutLiist[index].image,
                          Price: controller.prodcutLiist[index].price,
                          Rate: controller.prodcutLiist[index].rating.rate,
                          Productid: controller.prodcutLiist[index].id,
                          productModels: controller.prodcutLiist[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScree(
                                  productModels: controller.prodcutLiist[index],
                                ));
                          });
                    } else {
                      return BuildcardItems(
                          img: controller.SearchList[index].image,
                          Price: controller.SearchList[index].price,
                          Rate: controller.SearchList[index].rating.rate,
                          Productid: controller.SearchList[index].id,
                          productModels: controller.SearchList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScree(
                                  productModels: controller.SearchList[index],
                                ));
                          });
                    }
                  },
                ),
        );
      }
    });
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