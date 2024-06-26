import '../core/base/base_response_model.dart';
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

  toMovieDetail() {
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
