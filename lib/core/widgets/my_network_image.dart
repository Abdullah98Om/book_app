import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_color.dart';
import 'loader.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const MyNetworkImage(
      {super.key, required this.url, this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: fit,
        errorWidget: (context, url, error) {
          return Icon(Icons.image_not_supported_outlined,
              size: 40.sp, color: AppColor.primaryColor);
        },
        placeholder: (context, url) =>
            Center(child: loader(color: AppColor.primaryColor)),
        imageUrl: url);
  }
}
