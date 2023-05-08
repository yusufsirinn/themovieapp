import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../core/base/base_state.dart';
import '../../core/enums/status_enum.dart';
import '../../models/movie_details_model.dart';
import '../../services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final ITMDBMovieDetailsService _service;
  MovieDetailsBloc({required ITMDBMovieDetailsService service, required MovieDetails movie})
      : _service = service,
        super(MovieDetailsState(movie: movie)) {
    on<MovieDetailsFetched>(_onMovieDetailsFetched);
  }

  Future<void> _onMovieDetailsFetched(
    MovieDetailsFetched event,
    Emitter<MovieDetailsState> emit,
  ) async {
    if (event.id == null) return;
    emit(state.copyWith(status: Status.loading));
    final response = await _service.fetchMovieDetails(id: event.id!);

    response.data(onSucces: (movieDetails) {
      emit(
        state.copyWith(
          status: Status.success,
          movie: state.movie?.setDetails(movieDetails: movieDetails),
        ),
      );
    }, onError: (err) {
      emit(state.copyWith(status: Status.failure));
    });
  }
}
