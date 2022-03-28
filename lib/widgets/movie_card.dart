import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../constants/api_constants.dart';
import '../data/models/movie.dart';
import '../routes/router.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (() {
              context.router.push(DetailRoute(movie: movie));
            }),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  '$IMAGE_URL${movie.posterPath}',
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(height: 1),
          Text(movie.title),
        ],
      ),
    );
  }
}
