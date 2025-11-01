import 'package:book_app/core/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Search"),
      body: const Center(
        child: Text("Search Page"),
      ),
    );
  }
}
