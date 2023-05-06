import 'package:flutter/material.dart';

class AppNavigator {
  static final AppNavigator _singleton = AppNavigator._();
  static AppNavigator get instance => _singleton;
  AppNavigator._();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<T?> go<T extends Object?>(Widget route) {
    return _navigatorKey.currentState!.push<T>(MaterialPageRoute(builder: (BuildContext context) => route));
  }

  void pop() {
    _navigatorKey.currentState!.pop();
  }
}
