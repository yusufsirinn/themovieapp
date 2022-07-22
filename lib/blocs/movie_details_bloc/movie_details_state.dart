part of 'movie_details_bloc.dart';

class MovieDetailsState extends BaseState {
  final MovieDetails? movie;

  const MovieDetailsState({
    this.movie,
    super.status = Status.initial,
  });

  @override
  List<Object?> get props => [movie, status];

  MovieDetailsState copyWith({
    MovieDetails? movie,
    Status? status,
  }) {
    return MovieDetailsState(
      movie: movie ?? this.movie,
      status: status ?? this.status,
    );
  }
}
