import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/books/cubit/books_cubit.dart';
import '../../../controller/search/search_cubit.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/widgets/my_text_feild.dart';

class SearchPartWidget extends StatelessWidget {
  const SearchPartWidget({super.key, required this.booksState});

  final dynamic booksState;

  @override
  Widget build(BuildContext context) {
    return MyTextFeild(
      borderColor: AppColor.greyColor,
      borderOpacity: 1,
      borderWidth: 1,
      color: Colors.transparent,
      width: MediaQuery.sizeOf(context).width,
      icon: Icon(Icons.search, size: 25.sp, color: AppColor.greyColor),
      hint: "Search",
      title: "",
      onchange: (value) {
        if (value.isEmpty) {
          context.read<SearchCubit>().loadHistory();
        } else {
          if (booksState is BooksLoadedState) {
            context.read<SearchCubit>().searchBooks(value, booksState.books);
          }
        }
      },
      onFieldSubmitted: (p0) {
        context.read<SearchCubit>().saveSearch(p0);
      },
    );
  }
}
