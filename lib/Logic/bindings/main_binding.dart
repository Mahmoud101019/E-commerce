import 'package:flutter_e_commers/Logic/controllers/main_controller.dart';
import 'package:get/get.dart';

class MainBininding extends Bindings{
  @override
  void dependencies() {
   Get.put(MainController());
  }
}