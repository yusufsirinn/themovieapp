import 'package:flutter/rendering.dart';

enum AppPadding {
  small(4),
  medium(8),
  large(12);

  const AppPadding(this._size);

  final double _size;

  EdgeInsetsGeometry value() {
    return EdgeInsets.all(_size);
  }
}
