import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../../core.dart';

class Analytics {
  static IAnalytics? _analytics;

  static IAnalytics get instance {
    _analytics ??= AppAnalytics();
    return _analytics!;
  }

  Analytics.init(IAnalytics analytics) {
    _analytics = analytics;
  }
}

abstract class IAnalytics {
  late NavigatorObserver navigatorObserver;
  Future<void> log({required Event event, EventParameter? parameters});
}

class AppFirebaseAnalytics extends IAnalytics {
  late FirebaseAnalytics _analytics;
  AppFirebaseAnalytics() {
    _analytics = FirebaseAnalytics.instance;
    navigatorObserver = FirebaseAnalyticsObserver(analytics: _analytics);
  }

  @override
  Future<void> log({required Event event, EventParameter? parameters}) async {
    await _analytics.logEvent(
      name: event.name,
      parameters: parameters?.toMap(),
    );
  }
}

class AppAnalytics extends IAnalytics {
  AppAnalytics() {
    navigatorObserver = NavigatorLogger();
  }

  @override
  Future<void> log({required Event event, EventParameter? parameters}) async {
    Logger.info('AppAnalytics - Event - $event');
    Logger.info('AppAnalytics - EventParameter - $parameters');
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
