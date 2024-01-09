// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member, prefer_const_constructors, unused_import, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/Logic/controllers/main_controller.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final Controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            leading: Container(),
            actions: [
              Obx(() {
                return badges.Badge(
                    position: badges.BadgePosition.topEnd(top: 0, end: 3),
                    badgeAnimation: badges.BadgeAnimation.slide(
                        // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                        // curve: Curves.easeInCubic,
                        ),
                    showBadge: true,
                    badgeStyle: badges.BadgeStyle(
                        // badgeColor: color,
                        ),
                    badgeContent: Text(
                      cartController.Counter().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cardScreen);
                      },
                      icon: Image.asset("assets/images/shop.png"),
                    ));
                // Badge(
                //     position: BadgePosition.topEnd(top: 0, end: 3),
                //     badgeAnimation: BadgeAnimation.slide(
                //       disappearanceFadeAnimationDuration:
                //           Duration(milliseconds: 200),
                //       curve: Curves.easeInCubic,
                //     ),
                //     badgeContent: Text(
                //       cartController.Counter().toString(),
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     child: IconButton(
                //       onPressed: () {
                //         Get.toNamed(Routes.cardScreen);
                //       },
                //       icon: Image.asset("assets/images/shop.png"),
                //     )
                //     );
              })
            ],
            title: Text(Controller.title[Controller.currentIndex.value]),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: Controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: "",
              ),
            ],
            onTap: (index) {
              Controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: Controller.currentIndex.value,
            children: Controller.tab.value,
          ),
        );
      }),
    );
  }
}
