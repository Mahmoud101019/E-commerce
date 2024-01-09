import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<ProductModels>> getProduct() async {
    var respons = await http.get(Uri.parse('$baseUrl/products'));

    if (respons.statusCode == 200) {
      var jsonData = respons.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Faild to load Products");
    }
  }
}
