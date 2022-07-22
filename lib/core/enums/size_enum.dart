enum AppSize {
  xs(1),
  s(2),
  m(3),
  l(4),
  xl(6),
  xxl(8);

  const AppSize(this._size);

  final num _scaling = 4;

  final num _size;

  double value() {
    return (_scaling * _size).toDouble();
  }
}
