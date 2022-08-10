import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppConstants {
  static const baseURL = 'https://api.themoviedb.org/3';
}

abstract class Environment {
  static String apiKey = dotenv.get('TMDB_API_KEY');
}
