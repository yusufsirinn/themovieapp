import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:themovieapp/blocs/search_movies_bloc/search_movies_bloc.dart';
import 'package:themovieapp/core/enums/status_enum.dart';
import 'package:themovieapp/services/tmdb_search_movies_service/tmdb_search_movies_service.dart';

void main() {
  group('SearchMoviesBloc', () {
    var state = const SearchMoviesState();

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'emits [] when nothing is added',
      build: () => SearchMoviesBloc(service: TMDBSearchMoviesMockService()),
      expect: () => [],
    );

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'status is success when successful search is done',
      build: () => SearchMoviesBloc(service: TMDBSearchMoviesMockService()),
      act: (bloc) => bloc.add(const SearchMovies(query: 'car')),
      expect: () => <SearchMoviesState>[
        state.copyWith(status: Status.loading, query: 'car'),
        state.copyWith(status: Status.success, query: 'car', page: 1),
      ],
    );

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'status is failer when successful search is done',
      build: () => SearchMoviesBloc(service: TMDBSearchMoviesMockService()),
      act: (bloc) => bloc.add(const SearchMovies(query: '')),
      expect: () => <SearchMoviesState>[
        state.copyWith(status: Status.loading, query: ''),
        state.copyWith(status: Status.failure, query: ''),
      ],
    );
  });
}
