import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:themovieapp/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:themovieapp/core/enums/status_enum.dart';
import 'package:themovieapp/core/managers/network/models/error.dart';
import 'package:themovieapp/core/managers/network/models/response.dart';
import 'package:themovieapp/models/movie_details_model.dart';
import 'package:themovieapp/services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

import '../../mock/mock_services.dart';

void main() {
  group('MovieDetailsBloc', () {
    var state = const MovieDetailsState();
    late ITMDBMovieDetailsService service;

    setUp(() {
      service = TMDBMovieDetailsMockService();
    });

    blocTest<MovieDetailsBloc, MovieDetailsState>(
      'emits [] when nothing is added',
      build: () => MovieDetailsBloc(service: service, movie: MovieDetails(id: 22)),
      expect: () => [],
    );

    blocTest<MovieDetailsBloc, MovieDetailsState>(
      'status is success',
      setUp: () {
        var response = Response<MovieDetails>(response: MovieDetails(id: 22, title: 'Car'));
        when(() => service.fetchMovieDetails(id: 22)).thenAnswer(
          (_) async => response,
        );
      },
      build: () => MovieDetailsBloc(service: service, movie: MovieDetails(id: 22)),
      act: (bloc) => bloc.add(const MovieDetailsFetched(id: 22)),
      expect: () => <MovieDetailsState>[
        state.copyWith(status: Status.loading, movie: MovieDetails(id: 22)),
        state.copyWith(status: Status.success, movie: MovieDetails(id: 22, title: 'Car')),
      ],
      verify: ((bloc) {
        verify(() => service.fetchMovieDetails(id: 22)).called(1);
      }),
    );

    blocTest<MovieDetailsBloc, MovieDetailsState>(
      'status is failer',
      setUp: () {
        var response = Response<MovieDetails>(error: Error(status: 404, message: 'Not'));
        when(() => service.fetchMovieDetails(id: 1)).thenAnswer(
          (_) async => response,
        );
      },
      build: () => MovieDetailsBloc(service: service, movie: MovieDetails(id: 1)),
      act: (bloc) => bloc.add(const MovieDetailsFetched(id: 1)),
      expect: () => <MovieDetailsState>[
        state.copyWith(status: Status.loading, movie: MovieDetails(id: 1)),
        state.copyWith(status: Status.failure, movie: MovieDetails(id: 1)),
      ],
      verify: ((bloc) {
        verify(() => service.fetchMovieDetails(id: 1)).called(1);
      }),
    );
  });
}
