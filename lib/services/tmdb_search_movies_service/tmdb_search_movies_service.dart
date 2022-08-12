import 'package:themovieapp/core/managers/network/models/response.dart';

import '../../../models/search_movies_response_model.dart';
import '../../core/enums/path_enum.dart';
import '../../core/managers/network/network_service.dart';

abstract class ITMDBSearchMoviesService {
  Future<Response<SearchMoviesResponseModel>> searchMovies({
    required String query,
    int page = 1,
  });
}

class TMDBSearchMoviesMockService extends ITMDBSearchMoviesService {
  @override
  Future<Response<SearchMoviesResponseModel>> searchMovies({required String query, int page = 1}) async {
    if (query.length >= 2) {
    } else {}
    throw Exception();
  }
}

class TMDBSearchMoviesService extends ITMDBSearchMoviesService {
  @override
  Future<Response<SearchMoviesResponseModel>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    var queryParameters = {
      'page': '$page',
      'query': query,
    };

    return await NetworkManager.instance.fetch(
      model: SearchMoviesResponseModel(),
      queryParameters: queryParameters,
      path: Path.searchMovie.value(),
    );
  }
}
