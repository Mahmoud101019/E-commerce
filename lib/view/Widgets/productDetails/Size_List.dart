// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:get/get.dart';

class SizeListScreen extends StatefulWidget {
  const SizeListScreen({super.key});

  @override
  State<SizeListScreen> createState() => _SizeListScreenState();
}

class _SizeListScreenState extends State<SizeListScreen> {
  final List<String> SizeList = ["S", "M", "L", "XL", "XXL"];

  var curentSelect = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  curentSelect = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? curentSelect == index
                          ? pinkClr.withOpacity(0.4)
                          : Colors.black
                      : curentSelect == index
                          ? mainColor.withOpacity(0.4)
                          : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 2,
                  ),
                ),
                child: Text(
                  SizeList[index],
                  style: TextStyle(
                    color: Get.isDarkMode
                        ? curentSelect == index
                            ? Colors.white
                            : Colors.white
                        : curentSelect == index
                            ? Colors.black
                            : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ));
        }),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: SizeList.length,
      ),
    );
  }
}
