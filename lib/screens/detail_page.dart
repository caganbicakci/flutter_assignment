import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/api_constants.dart';
import '../data/models/movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: Image.network(
                  '$IMAGE_URL${movie.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              movie.title,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          CircleAvatar(
                            child: Text(movie.voteAverage.toString()),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(DateFormat.yMMMd()
                          .format(movie.releaseDate)
                          .toString()),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(movie.overview),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          title: const Text("Find more!"),
                          onPressed: () {
                            var url = '$TMDB_URL${movie.id}';
                            launchURL(url);
                          },
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
