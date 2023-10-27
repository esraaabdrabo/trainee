import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  void searchTextChanged(String searchQuery) {
    // Perform search
  }

  void searchCleared() {
    // Clear search query
  }

  void searchSubmitted() {
    // Submit search query
  }
}
