// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:themovieapp/models/movie_model.dart';

class MovieDetails extends Movie {
  String? backdropPath;
  List<Genres>? genres;
  String? overview;

  MovieDetails({
    this.genres,
    this.backdropPath,
    super.id,
    this.overview,
    super.posterPath,
    super.title,
    super.voteAverage,
  });

  @override
  MovieDetails fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    id = json['id'];
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    overview = json['overview'];
    posterPath = json['posterPath'];
    voteAverage = json['voteAverage'];
    title = json['title'];
    return this;
  }

  MovieDetails setDetails({required MovieDetails movieDetails}) {
    return MovieDetails(
      id: id,
      posterPath: posterPath,
      title: title,
      voteAverage: voteAverage,
      backdropPath: movieDetails.backdropPath,
      genres: movieDetails.genres,
      overview: movieDetails.overview,
    );
  }

  List<String?>? get genresNames => genres?.map((genre) => genre.name).toList();
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
