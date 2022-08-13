import '../../../models/search_movies_response_model.dart';
import '../../core/enums/path_enum.dart';
import '../../core/managers/network/network_service.dart';

abstract class ITMDBSearchMoviesService {
  FutureResponse<SearchMoviesResponseModel> searchMovies({required String query, int page = 1});
}

class TMDBSearchMoviesService extends ITMDBSearchMoviesService {
  @override
  FutureResponse<SearchMoviesResponseModel> searchMovies({required String query, int page = 1}) async {
    var queryParameters = {'page': '$page', 'query': query};

    return await NetworkManager.instance.fetch(
      model: SearchMoviesResponseModel(),
      queryParameters: queryParameters,
      path: Path.searchMovie.value(),
    );
  }
}
