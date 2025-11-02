import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_color.dart';

class HistoriesListWidget extends StatelessWidget {
  const HistoriesListWidget({super.key, required this.histories});
  final List<String> histories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: histories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Text(histories[index],
                style: TextStyle(
                    color: AppColor.greyColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400)),
          );
        });
  }
}
