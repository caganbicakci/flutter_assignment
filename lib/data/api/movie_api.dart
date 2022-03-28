import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/api_constants.dart';
import '../models/movie.dart';

class MovieApi {
  Future<List<Movie>?> getMoviesData() async {
    try {
      var response = await Dio().get(API_URL);
      if (response.statusCode != 200) {
        return null;
      } else {
        var results = response.data["results"];

        // if (kDebugMode) {
        //   print(results);
        // }

        List<Movie> movies = [];
        for (var element in results) {
          movies.add(Movie.fromJson(element));
        }
        return movies;
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
    }
    return null;
  }
}
