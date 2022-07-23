import 'package:themovieapp/models/movie_details_model.dart';

class Movie {
  int? id;
  String? posterPath;
  String? title;
  num? voteAverage;

  Movie({
    this.id,
    this.posterPath,
    this.title,
    this.voteAverage,
  });

  toMovieDetail() {
    return MovieDetails(
      id: id,
      posterPath: posterPath,
      title: title,
      voteAverage: voteAverage,
    );
  }

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['poster_path'] = posterPath;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}
