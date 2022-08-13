import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/blocs/search_movies_bloc/search_movies_bloc.dart';

void main() {
  group('SearchMoviesState', () {
    test('supports value comparison', () {
      expect(const SearchMoviesState(), const SearchMoviesState());
      expect(
        const SearchMoviesState().toString(),
        const SearchMoviesState().toString(),
      );
    });
  });
}
