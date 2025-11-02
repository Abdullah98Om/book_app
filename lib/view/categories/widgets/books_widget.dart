import 'package:animate_do/animate_do.dart';
import 'package:book_app/view/categories/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/book_model.dart';

class BooksWidget extends StatelessWidget {
  const BooksWidget({
    super.key,
    required this.books,
  });

  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
        childAspectRatio: 0.65,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return FadeInUp(
          duration: const Duration(milliseconds: 900),
          delay: Duration(milliseconds: (index * 150) % 1000),
          child: BookWidget(book: book),
        );
      },
    );
  }
}
