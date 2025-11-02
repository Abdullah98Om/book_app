import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../controller/books/cubit/books_cubit.dart';
import '../../../model/category_model.dart';
import 'category_title_widget.dart';

class ListCategoriesWidget extends StatelessWidget {
  const ListCategoriesWidget(
      {super.key, required this.categories, required this.cubit});

  final List<CategoryModel> categories;
  final BooksCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = cubit.selectedCategory == category.id;
        return GestureDetector(
          onTap: () {
            cubit.selectCategory(category.id);
          },
          child: FadeInRight(
              from: (index * 70) + 70,
              child: CategoryTitleWidget(
                  isSelected: isSelected, category: category)),
        );
      },
    );
  }
}
