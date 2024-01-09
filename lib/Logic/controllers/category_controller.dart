// ignore_for_file: non_constant_identifier_names

import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/services/category_services.dart';
import 'package:get/get.dart';

class Categorycontroller extends GetxController {
  var CategoryNameList = <String>[].obs;
  var IsCategoryloading = false.obs;
  var IsAllCategoryloading = false.obs;
  var categorylist = <ProductModels>[].obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    GetCategorys();
  }

  void GetCategorys() async {
    var CategoryName = await CategoryServices.GetCategory();
    try {
      IsCategoryloading(true);
      if (CategoryName.isNotEmpty) {
        CategoryNameList.addAll(CategoryName);
      }
    } finally {
      IsCategoryloading(false);
    }
  }
  //////////////////////////////////////////////
  //   void GetAllCategorys(
  //     String nameCategory
  //   ) async {
  //   var CategoryName = await AllCategoryService.getAllCategory(nameCategory);
  //   try {
  //     IsAllCategoryloading(true);
  //     if (CategoryName.isNotEmpty) {
  //       categorylist.value = CategoryName;
  //     }
  //   } finally {
  //     IsAllCategoryloading(false);
  //   }
  // }

    GetAllCategorys(String namecategory) async {
    IsAllCategoryloading(true);
    categorylist.value =
        await AllCategoryService.getAllCategory(namecategory);

    IsAllCategoryloading(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await GetAllCategorys(CategoryNameList[index]);

    if (categoryAllName != null) {
      categorylist.value = categoryAllName;
    }
  }
}
