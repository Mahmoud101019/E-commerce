// ignore_for_file: non_constant_identifier_names, file_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorPicker extends StatelessWidget {
  final bool Outerborder;
  final Color color;
   ColorPicker({
    required this.Outerborder,
    required this.color,
    Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Outerborder ? Border.all(color: color ,width: 0.5.w) : null,
      ),
      child: Container(
        height: 5.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      )
    ); 
  }
}