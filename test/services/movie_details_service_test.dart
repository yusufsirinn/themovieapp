import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/models/movie_details_model.dart';
import 'package:themovieapp/services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

void main() {
  late TMDBMovieDetailsService service;
  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    service = TMDBMovieDetailsService();
  });
  test('Fetch movie wiht id', () async {
    MovieDetails? response;
    var fetchedId = 222;
    await service.fetchMovieDetails(
      id: fetchedId,
      onSuccess: (res) {
        response = res;
      },
      onError: () {},
    );
    expect(response, isNotNull);
    expect(response?.id, fetchedId);
  });
}
