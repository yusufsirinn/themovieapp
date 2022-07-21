part of 'search_movies_bloc.dart';

@immutable
abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object?> get props => [];
}

class SearchMoviesQuery extends SearchMoviesEvent {
  final String query;
  const SearchMoviesQuery({required this.query});
}

class MoviesPagination extends SearchMoviesEvent {
  const MoviesPagination();
}
