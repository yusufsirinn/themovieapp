import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/core/core.dart';

void main() {
  test('AppNavigator instance should be a singleton', () {
    final instance1 = AppNavigator.instance;
    final instance2 = AppNavigator.instance;
    expect(instance1, equals(instance2));
  });

  testWidgets('AppNavigator go method should navigate to new page', (WidgetTester tester) async {
    final route = Container(key: const Key('test'));
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: AppNavigator.instance.navigatorKey,
        home: ElevatedButton(
          child: const Text('Go to new page'),
          onPressed: () => AppNavigator.instance.go(route),
        ),
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    final pageFinder = find.byKey(const Key('test'));
    expect(pageFinder, findsOneWidget);
  });
}
