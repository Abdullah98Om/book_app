import 'package:book_app/core/routers/routers_name.dart';
import 'package:book_app/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_color.dart';
import '../../core/widgets/my_app_bar.dart';
import '../categories/category_page.dart';
import '../profile/profile_page.dart';
import '../cart/cart_page.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int selectedIndex = 1;

  final List<Widget> screens = [
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  List<String> titels = [
    "Home",
    "Category",
    "Cart",
    "Profile",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: myAppBar(
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
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.secondryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25.sp), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu, size: 25.sp), label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 25.sp), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 25.sp), label: "Profile"),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
    );
  }
}
