import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/models/search_movies_response_model.dart';
import 'package:themovieapp/services/tmdb_search_movies_service/tmdb_search_movies_service.dart';

void main() {
  late ITMDBSearchMoviesService service;
  setUp(() {
    service = TMDBSearchMoviesService();
  });
  test('Fetch car movies', () async {
    SearchMoviesResponseModel? response;
    await service.searchMovies(
      query: 'car',
      onSuccess: (res) {
        response = res;
      },
      onError: () {},
    );
    expect(response, isNotNull);
  });

  test('Fetch car movies, page 2', () async {
    SearchMoviesResponseModel? response;
    await service.searchMovies(
      query: 'car',
      page: 2,
      onSuccess: (res) {
        response = res;
      },
      onError: () {},
    );
    expect(response?.page, 2);
  });
}
