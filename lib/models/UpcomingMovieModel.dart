class UpcomingMovieModel {
  final int id;
  final String movieName, releaseDate, posterPath;
  final rating;
  UpcomingMovieModel(
      {this.rating,
      this.movieName,
      this.id,
      this.posterPath,
      this.releaseDate});
  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      movieName: json['title'],
      posterPath: json['poster_path'],
      id: json["id"],
      rating: json["vote_average"],
      releaseDate: json["release_date"],
    );
  }
}
