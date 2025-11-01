import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/app_color.dart';

class AppToast {
  static void show(
          {required String message,
          Toast length = Toast.LENGTH_SHORT,
          ToastGravity postion = ToastGravity.BOTTOM,
          int time = 1,
          Color color = AppColor.secondryColor}) =>
      Fluttertoast.showToast(
          msg: message,
          toastLength: length,
          gravity: postion,
          timeInSecForIosWeb: time,
          backgroundColor: color,
          textColor: Colors.white,
          fontSize: 16.sp);
}
