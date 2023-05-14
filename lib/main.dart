import 'package:flutter/material.dart';

import 'core/core.dart';
import 'views/search_movies/search_movies_page.dart';

Future<void> main() async {
  await AppSetup.init();
  runApp(const TMDBApp());
}

class TMDBApp extends StatelessWidget {
  const TMDBApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: const SearchMoviesPage(),
      navigatorKey: AppNavigator.instance.navigatorKey,
      navigatorObservers: AppNavigator.instance.navigatorObservers,
      localizationsDelegates: TMDBAppLocalizations.localizationsDelegates,
      supportedLocales: TMDBAppLocalizations.supportedLocales,
    );
  }
}
