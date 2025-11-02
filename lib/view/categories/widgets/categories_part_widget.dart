import 'package:book_app/core/util/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/books/cubit/books_cubit.dart';
import 'list_categories_widget.dart';

class CategoriesPartWidget extends StatelessWidget {
  const CategoriesPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        height: 40.h,
        child: BlocBuilder<BooksCubit, BooksState>(
          buildWhen: (previous, current) =>
              current is CategoriesLoadedState || current is BooksLoadedState,
          builder: (context, state) {
            final cubit = context.read<BooksCubit>();
            final categories = cubit.allCategories;
            if (categories.isEmpty) {
              AppToast.show(message: "Not Found Categories.");
              return const SizedBox();
            }

            return categories.length > 1
                ? ListCategoriesWidget(categories: categories, cubit: cubit)
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
