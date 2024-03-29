enum AppDuration {
  low(1),
  medium(2),
  large(3);

  const AppDuration(this._seconds);

  final int _seconds;

  Duration get time {
    return Duration(seconds: _seconds);
  }
}
