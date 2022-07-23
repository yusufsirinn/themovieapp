enum Path {
  searchMovie('search/movie'),
  movie('movie');

  const Path(this.path);

  final String path;

  String value() {
    return '/$path';
  }

  String withId(int id) {
    return '${value()}/$id';
  }
}
