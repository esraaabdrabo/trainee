part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<String> searchResults;

  SearchSuccess({required this.searchResults});
}

class SearchFailure extends SearchState {}