import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/search_movies.dart';
import 'package:flutter_assignment/widgets/movie_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../bloc/movie_bloc/movie_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (contex, state) {
            if (state is MovieInitial) {
              context.read<MovieBloc>().add(MovieLoadEvent());
            }
            if (state is MovieLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MovieLoadedState) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      showSearch(
                        context: context,
                        delegate: SearchMovies(allMovies: state.apiResult),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: GestureDetector(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Search Movie"), Icon(Icons.search)],
                      )),
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  Expanded(child: MovieGridView(movieList: state.apiResult)),
                ],
              );
            }
            if (state is MovieErrorState) {
              return Center(
                child: Lottie.asset("assets/error_animation.json"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
