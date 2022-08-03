import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:themovieapp/services/tmdb_movie_details_service/tmdb_movie_details_service.dart';

import '../../core/base/base_state.dart';
import '../../core/enums/status_enum.dart';
import '../../models/movie_details_model.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final ITMDBMovieDetailsService _service;
  MovieDetailsBloc({required ITMDBMovieDetailsService service, required MovieDetails movie})
      : _service = service,
        super(
          MovieDetailsState(movie: movie),
        ) {
    on<MovieDetailsFetched>(_onMovieDetailsFetched);
  }

  Future<void> _onMovieDetailsFetched(MovieDetailsFetched event, Emitter<MovieDetailsState> emit) async {
    if (event.id == null) return;
    emit(state.copyWith(status: Status.loading));
    await _service.fetchMovieDetails(
      id: event.id!,
      onSuccess: (movieDetailsResponse) {
        emit(
          state.copyWith(
            status: Status.success,
            movie: state.movie?.setDetails(movieDetails: movieDetailsResponse),
          ),
        );
      },
      onError: (e) {
        emit(state.copyWith(status: Status.failure));
      },
    );
  }
}
