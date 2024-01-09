import 'package:flutter_e_commers/view/Screens/bottomNavigationBar/category_screen.dart';
import 'package:flutter_e_commers/view/Screens/bottomNavigationBar/favorites_screen.dart';
import 'package:flutter_e_commers/view/Screens/bottomNavigationBar/home_screen.dart';
import 'package:flutter_e_commers/view/Screens/bottomNavigationBar/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tab = [
    const HomeScreen(),
    const CategoryScreen(),
     FavoritesScreen(),
    const SettingsScreen()
  ].obs;

  final title = ["M&N Store", "Category", "favorite", "settings"];
}
