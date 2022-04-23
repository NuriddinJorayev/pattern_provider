// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:patterns_provider/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // using network images
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(MyApp());
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byKey(ValueKey("key1")), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsNWidgets(1));

      await tester.tap(find.byType(FloatingActionButton));
      // without await tester.pump() function
    });
  });
}
