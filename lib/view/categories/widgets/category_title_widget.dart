import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';
import '../../../model/category_model.dart';

class CategoryTitleWidget extends StatelessWidget {
  const CategoryTitleWidget({
    super.key,
    required this.isSelected,
    required this.category,
  });

  final bool isSelected;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(right: 20.w),
      decoration: BoxDecoration(
          border: isSelected
              ? const Border(
                  bottom: BorderSide(width: 2, color: AppColor.secondryColor))
              : null),
      child: Text(
        category.name,
        style: TextStyle(
          color: isSelected ? AppColor.primaryColor : AppColor.greyColor,
          fontSize: isSelected ? 18.sp : 16.sp,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}
