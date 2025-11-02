part of 'search_cubit.dart';

sealed class SearchState {}

class SearchInitialState extends SearchState {}

class SearchHistoryLoadedState extends SearchState {
  final List<String> history;
  SearchHistoryLoadedState(this.history);
}

class SearchResultsLoadedState extends SearchState {
  final List<BookModel> results;
  SearchResultsLoadedState(this.results);
}

class SearchClearedState extends SearchState {}
