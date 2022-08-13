import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test/test.dart';
import 'package:themovieapp/core/constants/app_constants.dart';

void main() {
  group('App Constants - ', () {
    test('Load Env', () {
      dotenv.testLoad(fileInput: '''TMDB_API_KEY=TEST''');
      expect(Environment.apiKey, isNotNull);
    });

    test('set base url', () {
      expect(AppConstants.baseURL, isNotNull);
    });
  });
}
