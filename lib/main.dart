import 'package:flutter/material.dart';

import 'core/core.dart';
import 'views/search_movies/search_movies_page.dart';

Future<void> main() async {
  await AppSetup.init();
  runApp(const TMDBApp());
}

class TMDBApp extends StatelessWidget {
  const TMDBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const SearchMoviesPage(),
      navigatorKey: AppNavigator.instance.navigatorKey,
      navigatorObservers: [Analytics.instance.navigatorObserver],
      localizationsDelegates: TMDBAppLocalizations.localizationsDelegates,
      supportedLocales: TMDBAppLocalizations.supportedLocales,
    );
  }
}
