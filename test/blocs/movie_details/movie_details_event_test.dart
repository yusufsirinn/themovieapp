import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/blocs/movie_details_bloc/movie_details_bloc.dart';

void main() {
  group('MovieDetailsEvent - ', () {
    group('MovieDetailsFetched - ', () {
      test('supports value comparison', () {
        expect(const MovieDetailsFetched(id: 1), const MovieDetailsFetched(id: 1));
      });
    });
  });
}
