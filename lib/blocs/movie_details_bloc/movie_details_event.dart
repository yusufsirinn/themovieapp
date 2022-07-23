part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

class MovieDetailsFetched extends MovieDetailsEvent {
  final int? id;

  const MovieDetailsFetched({required this.id});
}
