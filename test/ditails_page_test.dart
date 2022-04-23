import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patterns_provider/models/post_model.dart';
import 'package:patterns_provider/pages/ditails_paga.dart';

void main() async {
  testWidgets("ditails page test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Ditails_page("1")));
    expect(find.byType(FutureBuilder<List<Post>>), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNothing);
    expect(find.byKey(ValueKey("key 11111")), findsOneWidget);
  });
}
