import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

class AppNavigator {
  AppNavigator._();
  static final AppNavigator _singleton = AppNavigator._();
  static AppNavigator get instance => _singleton;

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  List<NavigatorObserver> navigatorObservers = [
    Analytics.observer,
    if (kDebugMode) NavigatorLogger(),
  ];

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

class NavigatorLogger extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    _navigationLog(name: 'Back', route: route, previousRoute: previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _navigationLog(name: 'Go', route: route, previousRoute: previousRoute);
  }

  void _navigationLog({String name = '-', Route? route, Route? previousRoute}) {
    Logger.info(
        "Navigation - $name -> route: ${route?.settings.name} - previousRoute: ${previousRoute?.settings.name}");
  }
}
