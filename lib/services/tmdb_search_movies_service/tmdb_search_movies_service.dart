import '../../../models/search_movies_response_model.dart';
import '../../core/constants/app_constants.dart';
import '../../core/enums/path_enum.dart';
import '../../core/managers/network/network_service.dart';

abstract class ITMDBSearchMoviesService {
  Future<void> searchMovies({
    required Function onSuccess,
    required Function onError,
    required String query,
    int page = 1,
  });
}

class TMDBSearchMoviesMockService extends ITMDBSearchMoviesService {
  @override
  Future<void> searchMovies(
      {required Function onSuccess, required Function onError, required String query, int page = 1}) async {
    if (query.length >= 2) {
      onSuccess(SearchMoviesResponseModel(page: 1, results: [], totalPages: 0, totalResults: 0));
    } else {
      onError('Error');
    }
  }
}

class TMDBSearchMoviesService extends ITMDBSearchMoviesService {
  @override
  Future<void> searchMovies({
    required Function onSuccess,
    required Function onError,
    required String query,
    int page = 1,
  }) async {
    var queryParameters = {
      'api_key': AppConstants.apiKey,
      'page': '$page',
      'query': query,
    };

    await NetworkManager.instance?.fetch(
      model: SearchMoviesResponseModel(),
      onSuccess: onSuccess,
      onError: onError,
      queryParameters: queryParameters,
      path: Path.searchMovie.value(),
    );
  }
}
