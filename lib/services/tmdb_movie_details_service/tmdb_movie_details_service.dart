import '../../../models/movie_details_model.dart';
import '../../core/enums/path_enum.dart';
import '../../core/managers/network/network_service.dart';

abstract class ITMDBMovieDetailsService {
  Future<void> fetchMovieDetails({
    required int id,
    required Function(MovieDetails) onSuccess,
    required Function onError,
  });
}

class ITMDBMovieDetailsMockService extends ITMDBMovieDetailsService {
  final _movies = [
    MovieDetails(id: 22, title: 'Car'),
  ];
  @override
  Future<void> fetchMovieDetails({required int id, required Function onSuccess, required Function onError}) async {
    try {
      var result = _movies.where((movie) => movie.id == id).toList();
      onSuccess(result.first);
    } catch (e) {
      onError('Error');
    }
  }
}

class TMDBMovieDetailsService extends ITMDBMovieDetailsService {
  @override
  Future<void> fetchMovieDetails({
    required int id,
    required Function(MovieDetails) onSuccess,
    required Function onError,
  }) async {
    await NetworkManager.instance?.fetch<MovieDetails>(
      model: MovieDetails(),
      onSuccess: onSuccess,
      onError: onError,
      path: Path.movie.withId(id),
    );
  }
}
