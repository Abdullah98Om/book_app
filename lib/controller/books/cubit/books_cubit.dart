import 'package:book_app/model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/category_model.dart';
import '../../../servicies/books_servicies.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final BooksServices _booksServices;
  BooksCubit(this._booksServices) : super(BooksInitialState()) {
    getAllCategories();
  }
  // جميع الفئات والكتب
  List<CategoryModel> allCategories = [CategoryModel(id: "-1", name: "All")];
  List<BookModel> allBooks = [];

  // كلمات البحث الأخيرة
  List<String> recentSearches = [];

  String? selectedCategory;

// get all categories
  getAllCategories() async {
    final response = await _booksServices.getAllCategories();

    response.fold((error) {
      emit(BooksErrorState(error.message));
    }, (data) {
      allCategories.addAll(data);
      emit(CategoriesLoadedState(data));
      if (allCategories.isNotEmpty) {
        getBooks();
      }
    });
  }

// read all books
  void getBooks() async {
    emit(BooksLoadingState());
    final response = await _booksServices.getBooks();
    response.fold((error) {
      emit(BooksErrorState(error.message));
    }, (data) {
      emit(BooksLoadedState(data, const []));
      selectCategory(allCategories.first.id);
    });
  }

// select category
  void selectCategory(String categoryId) {
    selectedCategory = categoryId;
    filterByCategory(categoryId);
  }

// filter books
  void filterByCategory(String? categoryId) {
    final currentState = state as BooksLoadedState;
    List<BookModel> displayedBooks = [];
    if (categoryId == null || categoryId == "-1") {
      displayedBooks = List.from(currentState.books);
    } else {
      displayedBooks = currentState.books
          .where((book) => book.category == categoryId)
          .toList();
    }
    emit(BooksLoadedState(currentState.books, displayedBooks));
  }

// search in books
  void searchBooks(String query) {
    // if (query.isEmpty) {
    //   return;
    //   // filterByCategory(selectedCategoryId);
    // } else {
    //   displayedBooks = allBooks.where((book) {
    //     final matchesQuery =
    //         book.title.toLowerCase().contains(query.toLowerCase()) ||
    //             book.author.toLowerCase().contains(query.toLowerCase());

    //     return matchesQuery;
    //   }).toList();

    //   _addRecentSearch(query);
    //   emit(BooksLoadedState(displayedBooks));
    // }
  }

  void _addRecentSearch(String query) {
    if (query.isEmpty) return;
    recentSearches.remove(query);
    recentSearches.insert(0, query);
    if (recentSearches.length > 10) {
      recentSearches = recentSearches.sublist(0, 10);
    }
  }
}
