import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/blocs/search_movies_bloc/search_movies_bloc.dart';

void main() {
  group('SearchMoviesEvent - ', () {
    group('SearchMovies - ', () {
      test('supports value comparison', () {
        expect(const SearchMovies(query: 'car'), const SearchMovies(query: 'car'));
      });
    });

    group('MoreMovies - ', () {
      test('supports value comparison', () {
        expect(const MoreMovies(), const MoreMovies());
      });
    });
  });
}
