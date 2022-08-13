import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/core/enums/path_enum.dart';

void main() {
  group('Path Enum -', () {
    test('searchMovie path value is equivalent to /search/movie', () {
      expect(Path.searchMovie.value(), equals('/search/movie'));
    });

    test('searchMovie path with id 2 is equivalent to /movie/2', () {
      expect(Path.movie.withId(2), equals('/movie/2'));
    });
  });
}
