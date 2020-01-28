import 'package:cinema_app/models/PopularMovieModel.dart';
import 'package:cinema_app/models/TopMovieModel.dart';
import 'package:cinema_app/models/UpcomingMovieModel.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/api.dart';
import 'package:cinema_app/widgets/popularmoviewidget.dart';
import 'package:flutter/widgets.dart';
import 'package:cinema_app/widgets/newmoviewidget.dart';
import 'package:cinema_app/widgets/reusable_container.dart';
import 'package:cinema_app/widgets/topmoviewidget.dart';

class MovieScreen extends StatefulWidget {
  static const String id = "movie_Screen";
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Future<List<PopularMovieModel>> popularMovie;
  Future<List<UpcomingMovieModel>> upcomingMovie;
  Future<List<TopMovieModel>> topMovie;

  Api _api;
  @override
  void initState() {
    super.initState();
    _api = Api();
    popularMovie = _api.getPopularMovie();
    upcomingMovie = _api.getUpcomingMovies();
    topMovie = _api.getTopMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            child: FutureBuilder<List<PopularMovieModel>>(
              future: popularMovie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PopularMovieWidget(snapshot: snapshot);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 20.0),
          ReusableContainer(
            titleName: "What's New ?",
            subtitle: "Show All",
          ),
          Container(
            child: FutureBuilder<List<UpcomingMovieModel>>(
                future: upcomingMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NewMovieWidget(snapshot: snapshot);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {}
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
          ReusableContainer(
            titleName: "Top Rated Movies",
            subtitle: "Show All",
          ),
          Container(
            child: FutureBuilder<List<TopMovieModel>>(
                future: topMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TopMovieWidget(snapshot: snapshot);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {}
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
