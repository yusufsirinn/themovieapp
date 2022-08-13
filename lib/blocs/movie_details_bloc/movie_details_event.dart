part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

class MovieDetailsFetched extends MovieDetailsEvent {
  final int? id;

  const MovieDetailsFetched({required this.id});
}
