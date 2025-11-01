import 'package:book_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar myAppBar(
    {required String title,
    bool center = true,
    List<Widget>? acts,
    Widget? leading}) {
  return AppBar(
    surfaceTintColor: Colors.transparent, // لتجنب تغير لون عند عمل scroll
    centerTitle: center,
    foregroundColor: AppColor.primaryColor,
    backgroundColor: Colors.white,
    actions: acts,
    leading: leading,
    shadowColor: AppColor.primaryColor.withOpacity(0),
    elevation: 1,
    title: Text(
      title,
      style: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 20.sp),
    ),
  );
}
