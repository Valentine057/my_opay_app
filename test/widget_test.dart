import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_opay_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const OPayApp());

    // Verify that the app starts and shows the main navigation items.
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Rewards'), findsWidgets);
    expect(find.text('Finance'), findsWidgets);
    expect(find.text('Cards'), findsWidgets);
    expect(find.text('Me'), findsWidgets);
  });
}
