import '../core/base/base_response_model.dart';
import 'movie_model.dart';

class SearchMoviesResponseModel extends BaseResponseModel {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  SearchMoviesResponseModel({this.page, this.results, this.totalPages, this.totalResults});

  @override
  SearchMoviesResponseModel fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(Movie().fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    return this;
  }
}
