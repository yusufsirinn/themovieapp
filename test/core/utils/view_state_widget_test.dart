import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:themovieapp/core/core.dart';

void main() {
  group('ViewStateWidget Test - ', () {
    late Widget initialWidget, successWidget, failureWidget, loadingWidget, defaultWidget;

    setUp(() {
      initialWidget = const Text('Initial Widget');
      successWidget = const Text('Success Widget');
      failureWidget = const Text('Failure Widget');
      loadingWidget = const Text('Loading Widget');
      defaultWidget = const Text('Default Widget');
    });

    testWidgets('Initial state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ViewStateWidget(status: Status.initial, initial: initialWidget)));

      expect(find.byWidget(initialWidget), findsOneWidget);
      expect(find.byWidget(successWidget), findsNothing);
      expect(find.byWidget(failureWidget), findsNothing);
      expect(find.byWidget(loadingWidget), findsNothing);
    });

    testWidgets('Success state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ViewStateWidget(status: Status.success, success: successWidget)));

      expect(find.byWidget(initialWidget), findsNothing);
      expect(find.byWidget(successWidget), findsOneWidget);
      expect(find.byWidget(failureWidget), findsNothing);
      expect(find.byWidget(loadingWidget), findsNothing);
    });

    testWidgets('Failure state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ViewStateWidget(status: Status.failure, failure: failureWidget)));

      expect(find.byWidget(initialWidget), findsNothing);
      expect(find.byWidget(successWidget), findsNothing);
      expect(find.byWidget(failureWidget), findsOneWidget);
      expect(find.byWidget(loadingWidget), findsNothing);
    });

    testWidgets('Loading state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ViewStateWidget(status: Status.loading, loading: loadingWidget)));

      expect(find.byWidget(initialWidget), findsNothing);
      expect(find.byWidget(successWidget), findsNothing);
      expect(find.byWidget(failureWidget), findsNothing);
      expect(find.byWidget(loadingWidget), findsOneWidget);
    });

    testWidgets('Default state', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ViewStateWidget(status: Status.success, defaultWidget: defaultWidget)));
      expect(find.byWidget(defaultWidget), findsOneWidget);
      expect(find.byWidget(initialWidget), findsNothing);
      expect(find.byWidget(successWidget), findsNothing);
      expect(find.byWidget(failureWidget), findsNothing);
      expect(find.byWidget(loadingWidget), findsNothing);
    });
  });
}
