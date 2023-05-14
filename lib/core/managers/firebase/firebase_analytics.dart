import 'package:firebase_analytics/firebase_analytics.dart';

import '../../core.dart';

class Analytics {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: _analytics);
  static Future<void> log({required Event event, EventParameter? parameters}) async {
    await _analytics.logEvent(
      name: event.name,
      parameters: parameters?.toMap(),
    );
  }
}
