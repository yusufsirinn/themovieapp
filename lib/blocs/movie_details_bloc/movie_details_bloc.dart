import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../core/base/base_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/enums/status_enum.dart';
import '../../core/enums/url_enum.dart';
import '../../models/movie_details_model.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final Dio _client;
  MovieDetailsBloc({required Dio client, required MovieDetails movie})
      : _client = client,
        super(
          MovieDetailsState(movie: movie),
        ) {
    on<MovieDetailsFetched>(_onMovieDetailsFetched);
  }

  Future<void> _onMovieDetailsFetched(MovieDetailsFetched event, Emitter<MovieDetailsState> emit) async {
    if (event.id == null) return;
    try {
      emit(state.copyWith(status: Status.loading));
      final movieDetailsResponse = await _fetchhMovie(id: event.id!);
      emit(state.copyWith(status: Status.success, movie: state.movie?.setDetails(movieDetails: movieDetailsResponse)));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<MovieDetails> _fetchhMovie({required int id}) async {
    var queryParameters = {
      'api_key': AppConstants.apiKey,
    };
    final response = await _client.get(URL.movie.withId(id), queryParameters: queryParameters);

    if (response.statusCode == HttpStatus.ok) {
      return MovieDetails.fromJson(response.data);
    }
    throw Exception();
  }
}
