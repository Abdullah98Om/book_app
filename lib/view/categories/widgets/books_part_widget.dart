import 'package:book_app/view/categories/widgets/books_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/books/cubit/books_cubit.dart';

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
            return BooksWidget(books: books);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
