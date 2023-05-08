import '../../../models/search_movies_response_model.dart';
import '../../core/core.dart';

abstract class ITMDBSearchMoviesService {
  FutureResponse<SearchMoviesResponseModel> searchMovies({
    required String query,
    int page = 1,
  });
}

class TMDBSearchMoviesService extends ITMDBSearchMoviesService {
  @override
  FutureResponse<SearchMoviesResponseModel> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final queryParameters = {'page': '$page', 'query': query};

    final res = await NetworkManager.instance.fetch<SearchMoviesResponseModel>(
      model: SearchMoviesResponseModel(),
      queryParameters: queryParameters,
      path: Path.searchMovie.value(),
    );
    return res;
  }
}
