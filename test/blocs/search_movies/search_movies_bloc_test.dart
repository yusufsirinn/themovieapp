import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:themovieapp/blocs/search_movies_bloc/search_movies_bloc.dart';
import 'package:themovieapp/core/enums/status_enum.dart';
import 'package:themovieapp/core/managers/network/models/error.dart';
import 'package:themovieapp/core/managers/network/models/response.dart';
import 'package:themovieapp/models/search_movies_response_model.dart';
import 'package:themovieapp/services/tmdb_search_movies_service/tmdb_search_movies_service.dart';

import '../../test_utils/mock_services.dart';

void main() {
  group('SearchMoviesBloc', () {
    var state = const SearchMoviesState();
    late ITMDBSearchMoviesService service;

    setUp(() {
      service = ITMDBSearchMoviesMockService();
    });

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'emits [] when nothing is added',
      build: () => SearchMoviesBloc(service: service),
      expect: () => [],
    );

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'status is success when successful search is done',
      setUp: (() {
        var response = Response<SearchMoviesResponseModel>(response: SearchMoviesResponseModel(page: 1));
        when(() => service.searchMovies(query: 'car')).thenAnswer(
          (_) async => response,
        );
      }),
      build: () => SearchMoviesBloc(service: service),
      act: (bloc) => bloc.add(const SearchMovies(query: 'car')),
      expect: () => <SearchMoviesState>[
        state.copyWith(status: Status.loading, query: 'car'),
        state.copyWith(status: Status.success, query: 'car', page: 1),
      ],
      verify: ((bloc) {
        verify(() => service.searchMovies(query: 'car')).called(1);
      }),
    );

    blocTest<SearchMoviesBloc, SearchMoviesState>(
      'status is failer when search is done',
      setUp: (() {
        var response = Response<SearchMoviesResponseModel>(error: Error(status: 404));
        when(() => service.searchMovies(query: any(named: 'query'), page: any(named: 'page'))).thenAnswer(
          (_) async => response,
        );
      }),
      build: () => SearchMoviesBloc(service: service),
      act: (bloc) => bloc.add(const SearchMovies(query: '')),
      expect: () => <SearchMoviesState>[
        state.copyWith(status: Status.loading, query: ''),
        state.copyWith(status: Status.failure, query: ''),
      ],
      verify: ((bloc) {
        verify(() => service.searchMovies(query: any(named: 'query'), page: any(named: 'page'))).called(1);
      }),
    );
  });
}
