class MovieDetailModel {
  final String movieName, posterPath, releaseDate, status, genre, overview;
  final int id, runTime, budget, voteCount;
  final double rating;
  MovieDetailModel(
      {this.rating,
      this.overview,
      this.genre,
      this.status,
      this.movieName,
      this.posterPath,
      this.releaseDate,
      this.id,
      this.runTime,
      this.budget,
      this.voteCount});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
        movieName: json['title'],
        releaseDate: json["release_date"],
        rating: json["vote_average"],
        id: json["id"],
        runTime: json["runtime"],
        budget: json["budget"],
        posterPath: json["poster_path"],
        voteCount: json["vote_count"],
        status: json["status"],
        genre: json["genres"][0]["name"],
        overview: json["overview"]);
  }
}
