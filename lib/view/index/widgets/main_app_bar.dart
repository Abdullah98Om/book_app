import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routers/routers_name.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/my_app_bar.dart';

AppBar mainAppBar(
    BuildContext context, List<String> titels, int selectedIndex) {
  return myAppBar(
      title: titels[selectedIndex],
      center: true,
      acts: [
        Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Icon(
            Icons.notifications_none_sharp,
            size: 25.sp,
            color: AppColor.primaryColor,
          ),
        )
      ],
      leading: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.search);
        },
        child: Icon(
          Icons.search,
          size: 25.sp,
          color: AppColor.primaryColor,
        ),
      ));
}
