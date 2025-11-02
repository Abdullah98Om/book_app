import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_color.dart';
import '../../../core/widgets/my_network_image.dart';
import '../../../model/book_model.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 160.h,
            width: 160.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: MyNetworkImage(
                  url: book.image,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              book.title,
              maxLines: 1,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
          ),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "\$${book.price}",
              maxLines: 1,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: AppColor.secondryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }
}
