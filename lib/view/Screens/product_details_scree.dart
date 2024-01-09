// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_e_commers/model/product_model.dart';
import 'package:flutter_e_commers/view/Widgets/productDetails/Add_Cart.dart';
import 'package:flutter_e_commers/view/Widgets/productDetails/Clothes_Info.dart';
import 'package:flutter_e_commers/view/Widgets/productDetails/ImageSlider.dart';
import 'package:flutter_e_commers/view/Widgets/productDetails/Size_List.dart';
import 'package:get/get.dart';

class ProductDetailsScree extends StatelessWidget {
    final ProductModels productModels;
  const ProductDetailsScree({
    required this.productModels,
    Key? key
    }): super (key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(
              ImageUrl: productModels.image,
            ),
              ClothesInfoScreen(
                title: productModels.title,
                ProId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
            const SizeListScreen(),
            AddCartScreen(
              Price: productModels.price,
              productModels: productModels,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
