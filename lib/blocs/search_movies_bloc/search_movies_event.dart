part of 'search_movies_bloc.dart';

@immutable
abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object?> get props => [];
}

class SearchMovies extends SearchMoviesEvent {
  final String query;
  const SearchMovies({required this.query});
}

class MoreMovies extends SearchMoviesEvent {
  const MoreMovies();
}
