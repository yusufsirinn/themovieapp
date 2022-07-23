import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../core/base/base_state.dart';
import '../../core/enums/status_enum.dart';
import '../../core/utils/event_transformer_utils.dart';
import '../../models/movie_model.dart';
import '../../models/search_movies_response_model.dart';
import '../../services/tmdb_search_movies_service/tmdb_search_movies_service.dart';

part 'search_movies_emitter.dart';
part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final ITMDBSearchMoviesService _service;
  SearchMoviesBloc({required ITMDBSearchMoviesService service})
      : _service = service,
        super(const SearchMoviesState()) {
    on<SearchMovies>(_onSearchMovies);
    on<MoreMovies>(_onMoreMovies, transformer: droppableTransformer());
  }

  Future<void> _onSearchMovies(SearchMovies event, Emitter<SearchMoviesState> emit) async {
    emit(state.copyWith(query: event.query, status: Status.loading));
    var searchMoviesEmitter = SearchMoviesEmitter(emit, state);
    await _service.searchMovies(
      query: state.query,
      onSuccess: (searchMoviesResponse) {
        searchMoviesEmitter.emitSuccess(searchMoviesResponse);
      },
      onError: (e) {
        searchMoviesEmitter.emitFailure();
      },
    );
  }

  Future<void> _onMoreMovies(MoreMovies event, Emitter<SearchMoviesState> emit) async {
    if (state.hasMax) return;
    var moreMoviesEmitter = MoreMoviesEmitter(emit, state);
    await _service.searchMovies(
      query: state.query,
      page: state.page + 1,
      onSuccess: (searchMoviesResponse) {
        moreMoviesEmitter.emitSuccess(searchMoviesResponse);
      },
      onError: (e) {
        moreMoviesEmitter.emitFailure();
      },
    );
  }
}
