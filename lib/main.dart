import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/localization/tmdb_app_localizations.dart';
import 'views/search_movies/search_movies_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const TMDBApp());
}

class TMDBApp extends StatelessWidget {
  const TMDBApp({Key? key}) : super(key: key);

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
