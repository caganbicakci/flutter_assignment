import 'package:flutter/material.dart';

import '../data/models/movie.dart';
import 'movie_card.dart';

class MovieGridView extends StatelessWidget {
  final List<Movie> movieList;
  const MovieGridView({required this.movieList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        thickness: 3,
        child: GridView.count(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: List.generate(movieList.length, (index) {
            return MovieCard(movie: movieList[index]);
          }),
        ));
  }
}
