import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/books/cubit/books_cubit.dart';
import '../../../core/theme/app_color.dart';

class CategoriesPartWidget extends StatelessWidget {
  const CategoriesPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        height: 30.h,
        child: BlocBuilder<BooksCubit, BooksState>(
          buildWhen: (previous, current) =>
              current is CategoriesLoadedState || current is BooksLoadedState,
          builder: (context, state) {
            final cubit = context.read<BooksCubit>();
            final categories = cubit.allCategories;
            if (categories.isEmpty) return const SizedBox();
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = cubit.selectedCategory == category.id;
                return GestureDetector(
                  onTap: () {
                    cubit.selectCategory(category.id); // Cubit يقوم بالفلترة
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(right: 20.w),
                    decoration: BoxDecoration(
                        border: isSelected
                            ? const Border(
                                bottom: BorderSide(
                                    width: 2, color: AppColor.secondryColor))
                            : null),
                    child: Text(
                      category.name,
                      style: TextStyle(
                        color: isSelected
                            ? AppColor.primaryColor
                            : AppColor.greyColor,
                        fontSize: isSelected ? 18.sp : 16.sp,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
