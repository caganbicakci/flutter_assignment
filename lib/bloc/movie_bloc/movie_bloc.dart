import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/movie_api.dart';
import '../../data/models/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApi movieApi;

  late StreamSubscription connectivityStreamSubscription;
  final connectivity = Connectivity();

  List<Movie> searchResult = [];

  MovieBloc({required this.movieApi}) : super(MovieInitial()) {
    checkInternetConnection();

    on<MovieEvent>((event, emit) async {
      emit(MovieLoadingState());
      List<Movie>? apiResult = await movieApi.getMoviesData();

      if (apiResult == null) {
        emit(MovieErrorState());
      } else {
        emit(MovieLoadedState(apiResult: apiResult));
      }
    });

    on<NetworkErrorEvent>((event, emit) {
      emit(NetworkErrorState());
    });

    on<MovieSearchEvent>((event, emit) {
      for (var movie in event.movies) {
        if (movie.title.contains(event.query)) {
          searchResult.add(movie);
        }
      }
      (MovieLoadedState(apiResult: searchResult));
    });
  }
  StreamSubscription<ConnectivityResult> checkInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        add(NetworkErrorEvent());
      } else {
        add(MovieLoadEvent());
      }
    });
  }

  @override
  Future<void> close() async {
    super.close();
    connectivityStreamSubscription.cancel();
  }
}
