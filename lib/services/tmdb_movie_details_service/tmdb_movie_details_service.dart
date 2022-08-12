import '../../../models/movie_details_model.dart';
import '../../core/enums/path_enum.dart';
import '../../core/managers/network/models/response.dart';
import '../../core/managers/network/network_service.dart';

abstract class ITMDBMovieDetailsService {
  Future<Response<MovieDetails>> fetchMovieDetails({
    required int id,
  });
}

class ITMDBMovieDetailsMockService extends ITMDBMovieDetailsService {
  @override
  Future<Response<MovieDetails>> fetchMovieDetails({required int id}) async {
    throw Exception();
  }
}

class TMDBMovieDetailsService extends ITMDBMovieDetailsService {
  @override
  Future<Response<MovieDetails>> fetchMovieDetails({
    required int id,
  }) async {
    return await NetworkManager.instance.fetch<MovieDetails>(
      model: MovieDetails(),
      path: Path.movie.withId(id),
    );
  }
}
