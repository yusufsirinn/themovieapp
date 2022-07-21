import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:themovieapp/core/constants/app_constants.dart';
import 'package:themovieapp/core/enums/url_enum.dart';
import 'package:themovieapp/models/search_movies_response_model.dart';

import '../../core/base/base_state.dart';
import '../../core/enums/status_enum.dart';
import '../../core/utils/event_transformer_utils.dart';
import '../../models/movie_model.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final Dio _client;
  SearchMoviesBloc({required Dio client})
      : _client = client,
        super(
          const SearchMoviesState(),
        ) {
    on<SearchMoviesQuery>(_onSearchMoviesQuery);
    on<MoviesPagination>(_onMoviesPagination, transformer: droppableTransformer());
  }

  Future<void> _onSearchMoviesQuery(SearchMoviesQuery event, Emitter<SearchMoviesState> emit) async {
    if (event.query.length < 2) return;
    emit(state.copyWith(query: event.query));
    try {
      emit(state.copyWith(status: Status.loading));
      final searchMoviesResponse = await _searchMovies(page: 1, query: state.query);
      emit(state.copyWith(
          status: Status.success,
          movies: searchMoviesResponse.results,
          hasMax: searchMoviesResponse.page == searchMoviesResponse.totalPages,
          page: searchMoviesResponse.page,
          totalPage: searchMoviesResponse.totalPages));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _onMoviesPagination(MoviesPagination event, Emitter<SearchMoviesState> emit) async {
    if (state.hasMax) return;
    try {
      emit(state.copyWith(status: Status.loading));
      final searchMoviesResponse = await _searchMovies(page: state.page + 1, query: state.query);
      emit(state.copyWith(
          status: Status.success,
          movies: List.of(state.movies)..addAll(searchMoviesResponse.results ?? []),
          hasMax: searchMoviesResponse.page == searchMoviesResponse.totalPages,
          page: searchMoviesResponse.page,
          totalPage: searchMoviesResponse.totalPages));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<SearchMoviesResponseModel> _searchMovies({required String query, int page = 1}) async {
    var queryParameters = {
      'api_key': AppConstants.apiKey,
      'page': '$page',
      'query': query,
    };
    final response = await _client.get('https://api.themoviedb.org/3/search/movie', queryParameters: queryParameters);

    print(response);
    if (response.statusCode == HttpStatus.ok) {
      return SearchMoviesResponseModel.fromJson(response.data);
    }
    throw Exception();
  }
}
