import 'package:book_app/controller/books/cubit/books_cubit.dart';
import 'package:book_app/controller/search/search_cubit.dart';
import 'package:book_app/core/di/dependancy_injection.dart';
import 'package:book_app/core/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../categories/widgets/books_widget.dart';
import 'widgets/histories_list_widget.dart';
import 'widgets/history_title_widget.dart';
import 'widgets/search_part_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final booksState = getIt<BooksCubit>().state;
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: myAppBar(title: "Search"),
          body: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                // Search Part
                SearchPartWidget(booksState: booksState),
                SizedBox(height: 16.h),

                // Title
                const HistoryTitleWidget(),
                // Results && History
                Expanded(child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    ///////////////////////////////////////////////////////
                    // Search Results Loaded State
                    if (state is SearchResultsLoadedState) {
                      final results = state.results;
                      return BooksWidget(books: results);
                    }
                    /////////////////////////////////////////////////////////
                    // Search History Loaded State
                    else if (state is SearchHistoryLoadedState) {
                      final histories = state.history;
                      return HistoriesListWidget(histories: histories);
                    }
                    //////////////////////////////////////////////////////////
                    else {
                      return const Center(child: Text("Not results"));
                    }
                  },
                ))
              ],
            ),
          ),
        );
      }),
    );
  }
}
