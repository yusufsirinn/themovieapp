import '../../../models/movie_details_model.dart';
import '../../core/core.dart';

abstract class ITMDBMovieDetailsService {
  FutureResponse<MovieDetails> fetchMovieDetails({
    required int id,
  });
}

class TMDBMovieDetailsService extends ITMDBMovieDetailsService {
  @override
  FutureResponse<MovieDetails> fetchMovieDetails({required int id}) async {
    return await NetworkManager.instance.fetch<MovieDetails>(
      model: MovieDetails(),
      path: Path.movie.withId(id),
    );
  }
}
