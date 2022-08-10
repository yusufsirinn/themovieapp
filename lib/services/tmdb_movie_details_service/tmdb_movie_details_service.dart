import '../../../models/movie_details_model.dart';
import '../../core/constants/app_constants.dart';
import '../../core/enums/path_enum.dart';
import '../../core/managers/network/network_service.dart';

typedef MovieDetailsCall = Function(MovieDetails);

abstract class ITMDBMovieDetailsService {
  Future<void> fetchMovieDetails({
    required int id,
    required MovieDetailsCall onSuccess,
    required Function onError,
  });
}

class ITMDBMovieDetailsMockService extends ITMDBMovieDetailsService {
  @override
  Future<void> fetchMovieDetails({required int id, required Function onSuccess, required Function onError}) async {
    try {
      var result = [].where((movie) => movie.id == id).toList();
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
    required MovieDetailsCall onSuccess,
    required Function onError,
  }) async {
    var queryParameters = {
      'api_key': Environment.apiKey,
    };

    await NetworkManager.instance?.fetch<MovieDetails>(
      model: MovieDetails(),
      onSuccess: onSuccess,
      onError: onError,
      queryParameters: queryParameters,
      path: Path.movie.withId(id),
    );
  }
}
