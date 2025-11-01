part of 'books_cubit.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object?> get props => [];
}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class CategoriesLoadedState extends BooksState {
  final List<CategoryModel> categories;
  const CategoriesLoadedState(this.categories);

  @override
  List<Object?> get props => [categories];
}

class BooksLoadedState extends BooksState {
  final List<BookModel> books;
  final List<BookModel> displayedBooks;
  const BooksLoadedState(this.books, this.displayedBooks);

  @override
  List<Object?> get props => [books, displayedBooks];
}

class BooksErrorState extends BooksState {
  final String message;
  const BooksErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
