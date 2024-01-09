import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/Logic/controllers/Product_controller.dart';
import 'package:flutter_e_commers/Logic/controllers/category_controller.dart';
import 'package:get/instance_manager.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProdcutController());
    Get.lazyPut(() => CartController());
    Get.put(Categorycontroller());
  }
}
