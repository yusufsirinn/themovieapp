// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_movies_bloc.dart';

class SearchMoviesState extends BaseState {
  final List<Movie> movies;
  final String query;
  final bool hasMax;
  final int page;
  final int totalPage;

  const SearchMoviesState({
    this.movies = const <Movie>[],
    this.query = '',
    this.hasMax = false,
    this.page = 0,
    this.totalPage = 0,
    super.status = Status.initial,
  });

  @override
  List<Object?> get props => [movies, status, query, page, totalPage];

  SearchMoviesState copyWith({
    List<Movie>? movies,
    String? query,
    bool? hasMax,
    int? page,
    int? totalPage,
    Status? status,
  }) {
    return SearchMoviesState(
      movies: movies ?? this.movies,
      query: query ?? this.query,
      hasMax: hasMax ?? this.hasMax,
      page: page ?? this.page,
      totalPage: totalPage ?? this.totalPage,
      status: status ?? this.status,
    );
  }
}
