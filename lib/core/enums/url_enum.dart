enum URL {
  searchMovie('search/movie');

  const URL(this.path);

  final String path;

  final String _basePath = 'https://api.themoviedb.org/3/';

  String value() {
    return '$_basePath/$path';
  }
}
