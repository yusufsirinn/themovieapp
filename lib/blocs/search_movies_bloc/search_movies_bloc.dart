import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../core/base/base_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/enums/status_enum.dart';
import '../../core/enums/url_enum.dart';
import '../../core/utils/event_transformer_utils.dart';
import '../../models/movie_model.dart';
import '../../models/search_movies_response_model.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final Dio _client;
  SearchMoviesBloc({required Dio client})
      : _client = client,
        super(
          const SearchMoviesState(),
        ) {
    on<SearchMovies>(_onSearchMovies);
    on<MoreMovies>(_onMoreMovies, transformer: droppableTransformer());
  }

  Future<void> _onSearchMovies(SearchMovies event, Emitter<SearchMoviesState> emit) async {
    emit(state.copyWith(query: event.query, status: Status.loading));
    try {
      final searchMoviesResponse = await _searchMovies(query: state.query);
      emit(state.copyWith(
          status: Status.success,
          movies: searchMoviesResponse.results,
          hasMax: _hasMax(page: searchMoviesResponse.page, totalPages: searchMoviesResponse.totalPages),
          page: searchMoviesResponse.page,
          totalPage: searchMoviesResponse.totalPages));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _onMoreMovies(MoreMovies event, Emitter<SearchMoviesState> emit) async {
    if (state.hasMax) return;
    try {
      final searchMoviesResponse = await _searchMovies(page: state.page + 1, query: state.query);
      emit(state.copyWith(
          status: Status.success,
          movies: List.of(state.movies)..addAll(searchMoviesResponse.results ?? []),
          hasMax: searchMoviesResponse.page == searchMoviesResponse.totalPages,
          page: searchMoviesResponse.page,
          totalPage: searchMoviesResponse.totalPages));
    } catch (e) {}
  }

  bool _hasMax({int? page, int? totalPages}) {
    if (totalPages == 0) return true;
    return page == totalPages;
  }

  Future<SearchMoviesResponseModel> _searchMovies({required String query, int page = 1}) async {
    var queryParameters = {
      'api_key': AppConstants.apiKey,
      'page': '$page',
      'query': query,
    };
    final response = await _client.get(URL.searchMovie.value(), queryParameters: queryParameters);

    if (response.statusCode == HttpStatus.ok) {
      return SearchMoviesResponseModel.fromJson(response.data);
    }
    throw Exception();
  }
}
