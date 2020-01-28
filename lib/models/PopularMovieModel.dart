class PopularMovieModel {
  final String movieName, posterPath, yearReleased;
  final int id;
  final rating;
  final fulltimeReleased;

  PopularMovieModel(
      {this.rating,
      this.id,
      this.movieName,
      this.fulltimeReleased,
      this.yearReleased,
      this.posterPath});
  factory PopularMovieModel.fromJson(Map<String, dynamic> json) {
    return PopularMovieModel(
      movieName: json["title"],
      id: json['id'],
      rating: (json["vote_average"]),
      yearReleased: json['release_date'],
      posterPath: json['poster_path'],
    );
  }
}
