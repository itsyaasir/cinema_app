import 'package:cinema_app/api.dart';
import 'package:cinema_app/models/MovieDetailModel.dart';
import 'package:cinema_app/models/MovieTrailerModel.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/widgets/detailmoviewidget.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  DetailScreen({this.id});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<MovieDetailModel> detailMovie;
  Future<List<MovieTrailerModel>> movieTrailer;
  Api _api;
  @override
  void initState() {
    _api = Api();
    detailMovie = _api.getMovieDetails(widget.id);
    movieTrailer = _api.getTrailerLink(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<MovieDetailModel>(
          future: detailMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DetailScreenWidget(
                snapshot: snapshot,
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
