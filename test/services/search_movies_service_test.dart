import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovieapp/core/managers/network/models/response.dart';
import 'package:themovieapp/models/search_movies_response_model.dart';
import 'package:themovieapp/services/tmdb_search_movies_service/tmdb_search_movies_service.dart';

import '../test_utils/mock_services.dart';

void main() {
  late ITMDBSearchMoviesService service;
  setUp(() {
    service = ITMDBSearchMoviesMockService();
  });
  test('Fetch car movies', () async {
    var mockData = Response<SearchMoviesResponseModel>(response: SearchMoviesResponseModel());
    when(() => service.searchMovies(query: any(named: 'query'))).thenAnswer(
      (_) async => mockData,
    );
    Response<SearchMoviesResponseModel>? data = await service.searchMovies(
      query: 'car',
    );
    expect(data.response, isNotNull);
  });

  test('Fetch car movies, page 2', () async {
    var mockData = Response<SearchMoviesResponseModel>(response: SearchMoviesResponseModel(page: 2));
    when(() => service.searchMovies(query: any(named: 'query'), page: any(named: 'page'))).thenAnswer(
      (_) async => mockData,
    );
    Response<SearchMoviesResponseModel>? data = await service.searchMovies(
      query: 'car',
    );
    expect(data.response, isNotNull);
    expect(data.response?.page, 2);
  });
}
