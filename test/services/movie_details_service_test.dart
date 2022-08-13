import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:themovieapp/core/managers/network/models/response.dart';
import 'package:themovieapp/models/movie_details_model.dart';
import 'package:themovieapp/services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

import '../test_utils/mock_services.dart';

void main() {
  var fetchedId = 222;
  late ITMDBMovieDetailsService service;
  setUp(() {
    service = TMDBMovieDetailsMockService();
  });
  test('Fetch movie wiht id', () async {
    var mockData = Response<MovieDetails>(response: MovieDetails(id: fetchedId));
    when(() => service.fetchMovieDetails(id: fetchedId)).thenAnswer(
      (_) async => mockData,
    );
    Response<MovieDetails>? data = await service.fetchMovieDetails(
      id: fetchedId,
    );
    expect(data, isNotNull);
    expect(data.response?.id, fetchedId);
  });
}
