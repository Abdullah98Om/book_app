import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<BottomNavigationBarItem> get nabBarItems {
  return [
    BottomNavigationBarItem(icon: Icon(Icons.home, size: 25.sp), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.menu, size: 25.sp), label: "Category"),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart, size: 25.sp), label: "Cart"),
    BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 25.sp), label: "Profile"),
  ];
}
