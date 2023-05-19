import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._();
  static final AppNavigator _singleton = AppNavigator._();
  static AppNavigator get instance => _singleton;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<T?> go<T extends Object?>(Widget route) {
    return _navigatorKey.currentState!.push<T>(
      MaterialPageRoute<T>(
        settings: RouteSettings(name: route.toString()),
        builder: (BuildContext context) => route,
      ),
    );
  }

  void pop() {
    _navigatorKey.currentState!.pop();
  }
}
