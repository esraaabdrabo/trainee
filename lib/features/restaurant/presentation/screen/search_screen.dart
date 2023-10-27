import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state_m/search_bloc/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchCubit searchCubit = SearchCubit();

  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    searchCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => searchCubit,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _searchController,
            onChanged: (searchQuery) {
              searchCubit.searchTextChanged(searchQuery);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                searchCubit.searchCleared();
              },
            ),
          ],
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchInitial) {
              return Container();
            } else if (state is SearchLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchSuccess) {
              return ListView.builder(
                itemCount: state.searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.searchResults[index]),
                  );
                },
              );
            } else if (state is SearchFailure) {
              return Center(
                child: Text('Search failed.'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
