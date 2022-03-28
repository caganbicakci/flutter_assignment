import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/models/movie.dart';
import 'package:flutter_assignment/widgets/movie_list.dart';

class SearchMovies extends SearchDelegate {
  final List<Movie> allMovies;

  SearchMovies({required this.allMovies});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        context.router.pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Movie> searchResult = allMovies
        .where(
          (movie) => movie.title.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return MovieGridView(movieList: searchResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
