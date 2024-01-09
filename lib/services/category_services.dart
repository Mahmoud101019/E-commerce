// ignore_for_file: non_constant_identifier_names

import 'package:flutter_e_commers/model/Category_model.dart';
import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/utils/my_string.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future<List<String>> GetCategory() async {
    var respons = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (respons.statusCode == 200) {
      var jsonData = respons.body;
      return categroyModelFromJson(jsonData);
    } else {
      return throw Exception("Faild to load Products");
    }
  }
}


class AllCategoryService {
  static Future<List<ProductModels>> getAllCategory(
    String CatergoryName,
  ) async {
    var respons = await http.get(Uri.parse('$baseUrl/products/category/$CatergoryName'));

    if (respons.statusCode == 200) {
      var jsonData = respons.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Faild to load Products");
    }
  }
}

