import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/blocs/movie_details_bloc/movie_details_bloc.dart';

void main() {
  group('MovieDetailsState', () {
    test('supports value comparison', () {
      expect(const MovieDetailsState(), const MovieDetailsState());
      expect(
        const MovieDetailsState().toString(),
        const MovieDetailsState().toString(),
      );
    });
  });
}
