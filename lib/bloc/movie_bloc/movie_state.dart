part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

//Movie Api
class MovieInitial extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<Movie> apiResult;
  MovieLoadedState({required this.apiResult});
}

//Network Connection
class MovieErrorState extends MovieState {}

class NetworkErrorState extends MovieState {}
