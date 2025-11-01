import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/books/cubit/books_cubit.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/my_network_image.dart';

class BooksPartWidget extends StatelessWidget {
  const BooksPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          // final cubit = context.read<BooksCubit>();
          if (state is BooksLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BooksErrorState) {
            return Center(child: Text(state.message));
          } else if (state is BooksLoadedState) {
            final books = state.displayedBooks;
            if (books.isEmpty) {
              return const Center(child: Text("لا توجد كتب لهذه الفئة"));
            }
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                childAspectRatio: 0.7,
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 160.h,
                        width: 160.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: MyNetworkImage(
                              url: book.image,
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          book.title,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$${book.price}",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColor.secondryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp),
                        ),
                      )
                    ],
                  ),
                ); //BookCard(book: book);
              },
            );
          } else if (state is BooksErrorState) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
