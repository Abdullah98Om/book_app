import 'package:book_app/servicies/books_servicies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/book_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BooksServices _booksServices;
  SearchCubit(this._booksServices) : super(SearchInitialState()) {
    loadHistory();
  }
  List<String> _history = [];
  List<String> get history => _history;

  // load all History
  loadHistory() async {
    _history = await _booksServices.getSearchHistory();
    emit(SearchHistoryLoadedState(List.from(_history)));
  }

// save Search String
  Future<void> saveSearch(String query) async {
    await _booksServices.addSearchQuery(query);
  }

  void clearHistory() async {
    await _booksServices.clearHistory();
    _history.clear();
    emit(SearchHistoryLoadedState([]));
  }

  void searchBooks(String query, List<BookModel> allBooks) {
    if (query.isEmpty) {
      emit(SearchClearedState());
      return;
    }
    final results = allBooks
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchResultsLoadedState(results));
  }
}
