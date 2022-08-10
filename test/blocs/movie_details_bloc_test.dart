import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:themovieapp/blocs/movie_details_bloc/movie_details_bloc.dart';
import 'package:themovieapp/core/enums/status_enum.dart';
import 'package:themovieapp/models/movie_details_model.dart';
import 'package:themovieapp/services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

void main() {
  group('SearchMoviesBloc', () {
    var state = const MovieDetailsState();

    blocTest<MovieDetailsBloc, MovieDetailsState>(
      'emits [] when nothing is added',
      build: () => MovieDetailsBloc(service: ITMDBMovieDetailsMockService(), movie: MovieDetails(id: 22)),
      expect: () => [],
    );

    blocTest<MovieDetailsBloc, MovieDetailsState>(
      'status is success',
      build: () => MovieDetailsBloc(service: ITMDBMovieDetailsMockService(), movie: MovieDetails(id: 22)),
      act: (bloc) => bloc.add(const MovieDetailsFetched(id: 22)),
      expect: () => <MovieDetailsState>[
        state.copyWith(status: Status.loading, movie: MovieDetails(id: 22)),
        state.copyWith(status: Status.success, movie: MovieDetails(id: 22, title: 'Car')),
      ],
    );

    blocTest<MovieDetailsBloc, MovieDetailsState>(
      'status is failer',
      build: () => MovieDetailsBloc(service: ITMDBMovieDetailsMockService(), movie: MovieDetails(id: 1)),
      act: (bloc) => bloc.add(const MovieDetailsFetched(id: 1)),
      expect: () => <MovieDetailsState>[
        state.copyWith(status: Status.loading, movie: MovieDetails(id: 1)),
        state.copyWith(status: Status.failure, movie: MovieDetails(id: 1)),
      ],
    );
  });
}
