import '../core/core.dart';
import 'movie_details_model.dart';

class Movie extends BaseResponseModel {
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

  String get vote => voteAverage != null ? voteAverage!.toStringAsFixed(1) : '-';

  MovieDetails toMovieDetail() {
    return MovieDetails(
      id: id,
      posterPath: posterPath,
      title: title,
      voteAverage: voteAverage,
    );
  }

  @override
  Movie fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    title = json['title'];
    voteAverage = json['vote_average'];
    return this;
  }
}
