import 'package:book_app/core/di/dependancy_injection.dart';
import 'package:book_app/view/categories/widgets/books_part_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controller/books/cubit/books_cubit.dart';
import 'widgets/categories_part_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BooksCubit>(), // أو BooksCubit(BooksServices())
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // شريط الفئات
          const CategoriesPartWidget(),

          SizedBox(height: 16.h),

          // قائمة الكتب (Grid)
          const BooksPartWidget(),
        ],
      ),
    );
  }
}
