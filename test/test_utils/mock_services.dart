import 'package:mocktail/mocktail.dart';
import 'package:themovieapp/services/tmdb_movie_details_service/tmdb_movie_details_service.dart';
import 'package:themovieapp/services/tmdb_search_movies_service/tmdb_search_movies_service.dart';

class TMDBMovieDetailsMockService extends Mock implements ITMDBMovieDetailsService {}

class ITMDBSearchMoviesMockService extends Mock implements ITMDBSearchMoviesService {}
