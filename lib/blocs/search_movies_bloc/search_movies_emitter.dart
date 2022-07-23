part of 'search_movies_bloc.dart';

abstract class ISearchMoviesEmitter {
  final Emitter<SearchMoviesState> emit;
  final SearchMoviesState state;

  ISearchMoviesEmitter(
    this.emit,
    this.state,
  );

  void emitSuccess(SearchMoviesResponseModel searchMoviesResponse) {
    emit(
      state.copyWith(
        status: Status.success,
        movies: _setMovies(searchMoviesResponse),
        hasMax: _hasMax(page: searchMoviesResponse.page, totalPages: searchMoviesResponse.totalPages),
        page: searchMoviesResponse.page,
        totalPage: searchMoviesResponse.totalPages,
      ),
    );
  }

  void emitFailure() {
    emit(state.copyWith(status: Status.failure));
  }

  bool _hasMax({int? page, int? totalPages}) {
    if (totalPages == 0) return true;
    return page == totalPages;
  }

  List<Movie>? _setMovies(SearchMoviesResponseModel searchMoviesResponse);
}

class SearchMoviesEmitter extends ISearchMoviesEmitter {
  SearchMoviesEmitter(super.emit, super.state);

  @override
  List<Movie>? _setMovies(SearchMoviesResponseModel searchMoviesResponse) {
    return searchMoviesResponse.results;
  }
}

class MoreMoviesEmitter extends ISearchMoviesEmitter {
  MoreMoviesEmitter(super.emit, super.state);

  @override
  List<Movie>? _setMovies(SearchMoviesResponseModel searchMoviesResponse) {
    return List.of(state.movies)..addAll(searchMoviesResponse.results ?? []);
  }
}
