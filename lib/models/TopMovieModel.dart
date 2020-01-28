class TopMovieModel {
  final int id;
  final String movieName, releaseDate, posterPath;
  final rating;
  TopMovieModel(
      {this.rating,
      this.movieName,
      this.id,
      this.posterPath,
      this.releaseDate});
  factory TopMovieModel.fromJson(Map<String, dynamic> json) {
    return TopMovieModel(
      movieName: json['title'],
      posterPath: json['poster_path'],
      id: json["id"],
      rating: json["vote_average"],
      releaseDate: json["release_date"],
    );
  }
}
