// ignore_for_file: file_names, non_constant_identifier_names, unnecessary_null_in_if_null_operators
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartController extends GetxController {
  var ProductsMap = {}.obs;
////////////////////////////////////////////////////////////////
  void addProductToCard(ProductModels productModels) {
    if (ProductsMap.containsKey(productModels)) {
      ProductsMap[productModels] += 1;
    } else {
      ProductsMap[productModels] = 1;
    }
  }

////////////////////////////////////////////////////////////////
  void removeProductfromCard(ProductModels productModels) {
    if (ProductsMap.containsKey(productModels) &&
        ProductsMap[productModels] == 1) {
      ProductsMap.removeWhere((key, value) => key == productModels);
    } else {
      ProductsMap[productModels] -= 1;
    }
  }

////////////////////////////////////////////////////////////////
  void removeOneProduct(ProductModels productModels) {
    ProductsMap.removeWhere((key, value) => key == productModels);
  }

////////////////////////////////////////////////////////////////
  void ClearAllProduct() {
    Get.defaultDialog(
        title: "Clear Products",
        titleStyle: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        middleText: "Are you sure yo need Cleare Products",
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
          Get.toNamed(Routes.cardScreen);
        },
        onConfirm: () {
          ProductsMap.clear();
          Get.back();
        },
        buttonColor: Get.isDarkMode ? pinkClr : mainColor);
  }

////////////////////////////////////////////////////////////////
  get ProductSubTotal =>
      ProductsMap.entries.map((e) => e.key.price * e.value).toList();
////////////////////////////////////////////////////////////////
  // get total=>ProductsMap.entries
  //         .map((e) => e.key.price * e.value)
  //         .toList()
  //         .reduce((value, element) => value + element)
  //         .toStringAsFixed(2);
  get total {
    var totalValue = 0.00.toString();
    var itemsList =
        ProductsMap.entries.map((e) => e.key.price * e.value).toList();
    if (itemsList.isNotEmpty) {
      totalValue = itemsList
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    }
    return totalValue.toString();
  }

  int Counter() {
    var itemsList = ProductsMap.entries.map((e) => e.value).toList();
    if (itemsList.isEmpty) {
      return 0;
    }
    return itemsList.reduce((value, element) => value + element);
  }

  // int Counter() {
  //   return ProductsMap.entries
  //       .map((e) => e.value)
  //       .toList()
  //       .reduce((value, element) => value + element);
  // }
////////////////////////////////////////////////////////////////
  // Map<dynamic,dynamic> Productmodel =
  // {
  //   "A":[
  //      ProductModels(
  //   id: 1,
  //   title:"",
  //   price: 10.3,
  //   description: "description",
  //   category: null,
  //   image: "image",
  //   rating: Rating.fromJson({})),
  //     ProductModels(
  //   id: 3,
  //   title:"",
  //   price: 10.3,
  //   description: "description",
  //   category: null,
  //   image: "image",
  //   rating: Rating.fromJson({})),
  //   ],
  //   "B": ProductModels(
  //   id: 2,
  //   title:"",
  //   price: 10.3,
  //   description: "description",
  //   category: null,
  //   image: "image",
  //   rating: Rating.fromJson({})),
  // };

}
