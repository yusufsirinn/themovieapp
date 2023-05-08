import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:themovieapp/main.dart' as app;
import 'package:themovieapp/views/search_movies/search_movies_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Car is searched and then cars 2 is found', (tester) async {
    await app.main();
    await tester.pumpAndSettle();
    final searchTextField = find.byKey(const ValueKey(SearchMoviesTextField));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.enterText(searchTextField, 'cars');
    await tester.pumpAndSettle(const Duration(seconds: 3));
    final titleFinder = find.text('Cars 2');

    expect(titleFinder, findsWidgets);
  });
}
