import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/design_system/atoms/indicator.dart';

void main() {
  testWidgets(
    'Render Indicator',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const Indicator(),
      );

      await tester.pump();

      expect(
        find.byType(Indicator),
        findsOneWidget,
      );
    },
  );
}
