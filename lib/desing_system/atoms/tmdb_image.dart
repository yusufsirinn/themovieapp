import 'package:flutter/material.dart';

class TMDBImage extends StatelessWidget {
  final String? path;
  const TMDBImage({Key? key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _imageTMDBFullUrl(path),
      fit: BoxFit.fitHeight,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return _placeHolder();
      },
      errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace) {
        return _placeHolder();
      },
    );
  }

  Widget _placeHolder() {
    return const Center(child: Text('TMDB'));
  }

  String _imageTMDBFullUrl(String? path) {
    return 'https://image.tmdb.org/t/p/original/$path';
  }
}
