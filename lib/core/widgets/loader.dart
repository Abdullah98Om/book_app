import 'package:flutter/material.dart';

import '../theme/app_color.dart';

Widget loader({Color? color}) {
  return Center(
      child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(color ?? AppColor.primaryColor)));
}
