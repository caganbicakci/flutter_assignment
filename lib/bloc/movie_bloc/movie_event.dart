part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class MovieLoadEvent extends MovieEvent {}

class NetworkErrorEvent extends MovieEvent {}

class MovieSearchEvent extends MovieEvent {
  final List<Movie> movies;
  final String query;
  MovieSearchEvent({required this.movies, required this.query});
}
