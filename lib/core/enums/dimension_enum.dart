import 'package:flutter/material.dart';

enum AppDimension {
  xs(1),
  s(2),
  m(3),
  l(4),
  xl(6),
  xxl(8);

  const AppDimension(this._size);

  final num _scaling = 4;

  final num _size;

  double get size {
    return (_scaling * _size).toDouble();
  }

  SizedBox get width => SizedBox(width: size);
  SizedBox get height => SizedBox(height: size);
}
