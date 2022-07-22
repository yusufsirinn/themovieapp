import 'package:flutter/material.dart';
import 'package:themovieapp/core/localization/tmdb_app_localizations.dart';

import 'views/search_movies/search_movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const SearchMoviesPage(),
      localizationsDelegates: TMDBAppLocalizations.localizationsDelegates,
      supportedLocales: TMDBAppLocalizations.supportedLocales,
    );
  }
}
