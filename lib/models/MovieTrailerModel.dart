class MovieTrailerModel {
  final String trailerMovie;
  MovieTrailerModel({this.trailerMovie});
  factory MovieTrailerModel.fromJson(Map<String, dynamic> json) {
    return MovieTrailerModel(
      trailerMovie: json["key"],
    );
  }
}
