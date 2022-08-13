import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/desing_system/atoms/tmdb_image.dart';

import '../../test_utils/pump_app.dart';

void main() {
  group('Render TMDBImage - ', () {
    testWidgets('null path render 🎬', (WidgetTester tester) async {
      await tester.pumpApp(
        const TMDBImage(),
      );

      await tester.pump();

      var widget = find.text('🎬');

      expect(
        widget,
        findsOneWidget,
      );
    });

    testWidgets('with path render', (WidgetTester tester) async {
      await tester.pumpApp(const TMDBImage(path: ''));

      await tester.pump();

      var widget = find.byType(Image);

      expect(
        widget,
        findsOneWidget,
      );
    });
  });
}

class Metarial {}
