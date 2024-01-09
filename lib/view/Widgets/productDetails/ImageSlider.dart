// ignore_for_file: unnecessary_import, file_names, non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Cart_controlloer.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:flutter_e_commers/view/Widgets/productDetails/Color_picker.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String ImageUrl;
  ImageSlider({required this.ImageUrl, Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
  final cartController = Get.find<CartController>();
  final List<Color> ColorSelcted = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  int CurentPage = 0;
  int Curentcolor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
            height: 60.h,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                CurentPage = index;
              });
            },
          ),
          itemBuilder: ((context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.ImageUrl), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(25)),
            );
          }),
        ),
        Positioned(
            bottom: 10,
            left: 160,
            child: AnimatedSmoothIndicator(
              activeIndex: CurentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 2.h,
                  dotWidth: 4.w,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotColor: Colors.black),
            )),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 28.h,
              width: 15.w,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30)),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Curentcolor = index;
                        });
                      },
                      child: ColorPicker(
                          Outerborder: Curentcolor == index,
                          color: ColorSelcted[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 1.h,
                    );
                  },
                  itemCount: ColorSelcted.length),
            )),
        Container(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
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
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.cardScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Get.isDarkMode ? pinkClr : mainColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          size: 30,
                        ),
                      ),
                    ));
                // Badge(
                //   position: BadgePosition.topEnd(top: 0, end: 3),
                //   badgeAnimation: BadgeAnimation.slide(
                //     disappearanceFadeAnimationDuration:
                //         Duration(milliseconds: 200),
                //     curve: Curves.easeInCubic,
                //   ),
                //   badgeContent: Text(
                //     cartController.Counter().toString(),
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   child: InkWell(
                //     onTap: () {
                //       Get.toNamed(Routes.cardScreen);
                //     },
                // child: Container(
                //   padding: EdgeInsets.all(8),
                //   decoration: BoxDecoration(
                //       color: Get.isDarkMode ? pinkClr : mainColor,
                //       shape: BoxShape.circle),
                //   child: Icon(
                //     Icons.shopping_cart,
                //     color: Get.isDarkMode ? Colors.black : Colors.white,
                //     size: 30,
                //   ),
                // ),
                // ),
                // );
              }),
            ],
          ),
        )
      ],
    );
  }
}
