import 'dart:convert';
import 'package:cinema_app/models/MovieDetailModel.dart';
import 'package:cinema_app/models/MovieTrailerModel.dart';
import 'package:cinema_app/models/TopMovieModel.dart';
import 'package:http/http.dart' as http;
import 'package:cinema_app/models/PopularMovieModel.dart';
import 'package:cinema_app/models/UpcomingMovieModel.dart';

class Api {
  static const apiKey = "API_KEY";
  static const url = "https://api.themoviedb.org/3";
  var httpClient = http.Client();

  Future<List<PopularMovieModel>> getPopularMovie() async {
    final response = await http.get("$url/movie/popular?api_key=$apiKey");
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
      return parsed
          .map<PopularMovieModel>((json) => PopularMovieModel.fromJson(json))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<UpcomingMovieModel>> getUpcomingMovies() async {
    final response = await http.get("$url/movie/upcoming?api_key=$apiKey");
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
      return parsed
          .map<UpcomingMovieModel>((json) => UpcomingMovieModel.fromJson(json))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<TopMovieModel>> getTopMovies() async {
    final response = await http.get("$url/movie/top_rated?api_key=$apiKey");
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
      return parsed
          .map<TopMovieModel>((json) => TopMovieModel.fromJson(json))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<MovieTrailerModel>> getTrailerLink(int movieID) async {
    final response =
        await http.get("$url/movie/$movieID/videos?api_key=$apiKey");
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['results'].cast<Map<String, dynamic>>();
      print(parsed);
      return parsed
          .map<MovieTrailerModel>((json) => MovieTrailerModel.fromJson(json))
          .toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<MovieDetailModel> getMovieDetails(int movieId) async {
    final response = await http.get("$url/movie/$movieId?api_key=$apiKey");
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
