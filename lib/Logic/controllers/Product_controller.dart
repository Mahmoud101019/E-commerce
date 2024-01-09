// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProdcutController extends GetxController {
  var prodcutLiist = <ProductModels>[].obs;
  var favouritLiest = <ProductModels>[].obs;
  var Isloading = true.obs;
  var storge = GetStorage();
  var SearchList = <ProductModels>[].obs;
  TextEditingController SearchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // storge.read<List>("Isfavourit");
    List? storedShoppings = storge.read<List>('Isfavourit');

    if (storedShoppings != null) {
      favouritLiest =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    GetProdcut();
  }

  void GetProdcut() async {
    var Prodcuts = await ProductService.getProduct();

    try {
      Isloading(true);
      if (Prodcuts.isNotEmpty) {
        prodcutLiist.addAll(Prodcuts);
      }
    } finally {
      Isloading(false);
    }
  }

  //////////////////////////////////////////////////////////////////////////

  void managefavourit(int Productid) async {
    var indexFavourit =
        favouritLiest.indexWhere((element) => element.id == Productid);
    if (indexFavourit >= 0) {
      favouritLiest.removeAt(indexFavourit);
      await storge.remove("Isfavourit");
    } else {
      favouritLiest
          .add(prodcutLiist.firstWhere((element) => element.id == Productid));

      await storge.write("Isfavourit", favouritLiest);
    }
  }

  bool Isfavourit(int Productid) {
    return favouritLiest.any((element) => element.id == Productid);
  }
  //////////////////////////////////////////////////////////////////////////

  void addSearchToList(String SearchName) {
    SearchName = SearchName.toLowerCase();
    SearchList.value = prodcutLiist.where((search) {
      var Searchprice = search.price.toString().toLowerCase();
      var SearchTitle = search.title.toLowerCase();

      return SearchTitle.contains(SearchName) ||
          Searchprice.toString().contains(SearchName);
    }).toList();

    update();
  }

  //////////////////////////////////////////////////////////////////////////

  void ClearSearch() {
    SearchTextController.clear();
    addSearchToList("");
  }
}
