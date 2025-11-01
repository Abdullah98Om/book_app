import 'package:book_app/view/categories/category_page.dart';
import 'package:book_app/view/profile/profile_page.dart';
import 'package:book_app/view/cart/cart_page.dart';
import 'package:book_app/view/index/index.dart';
import 'package:book_app/view/search/search_page.dart';
import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import 'routers_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RoutesName.indexPage: (_) => const Index(),
      RoutesName.search: (_) => const SearchPage(),
      RoutesName.cart: (_) => const CartPage(),
      RoutesName.category: (_) => const CategoryPage(),
      RoutesName.profile: (_) => const ProfilePage(),
    };

    final pageBuilder = routes[settings.name];
    // إذا الصفحة غير موجودة
    if (pageBuilder == null) {
      return _errorRoute();
    }

    return MaterialPageRoute(builder: pageBuilder, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(
          child: Text(
            'لا توجد صفحة ..',
            style: TextStyle(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
