import 'package:flutter/material.dart';

import '../../core/core.dart';

class TMDBImage extends StatelessWidget {
  final String? path;
  const TMDBImage({Key? key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path == null) return const _PlaceHolder();
    return Hero(
      tag: path ?? '',
      child: Image.network(
        _imageTMDBFullUrl(path),
        fit: BoxFit.fitHeight,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return const _PlaceHolder();
        },
        errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace) {
          return const _PlaceHolder();
        },
      ),
    );
  }

  String _imageTMDBFullUrl(String? path) {
    return 'https://image.tmdb.org/t/p/original/$path';
  }
}

class _PlaceHolder extends StatelessWidget {
  const _PlaceHolder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '🎬',
        style: TextStyle(
          fontSize: AppDimension.xxl.size,
        ),
      ),
    );
  }
}
