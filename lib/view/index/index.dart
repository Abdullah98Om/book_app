import 'package:book_app/view/home/home_page.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_color.dart';
import '../categories/category_page.dart';
import '../profile/profile_page.dart';
import '../cart/cart_page.dart';
import 'widgets/main_app_bar.dart';
import 'widgets/navbar_items.dart';

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
    const ProfilePage()
  ];

  List<String> titels = ["Home", "Category", "Cart", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: mainAppBar(context, titels, selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroundColor,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.secondryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: nabBarItems,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
    );
  }
}
