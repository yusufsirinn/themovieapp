enum URL {
  searchMovie('search/movie'),
  movie('movie');

  const URL(this.path);

  final String path;

  final String _basePath = 'https://api.themoviedb.org/3';

  String value() {
    return '$_basePath/$path';
  }

  String withId(int id) {
    return '${value()}/$id';
  }
}
