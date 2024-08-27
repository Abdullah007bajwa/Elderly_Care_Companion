import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elderly_care_companion/main.dart';
import 'package:elderly_care_companion/services/gemini_service.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Create a dummy instance of GeminiService with a placeholder API key
    final geminiService = GeminiService(apiKey: 'AIzaSyAf4bggM6glD_VDQH7Ul7HsE7UxdEcCj5I');

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(geminiService: geminiService));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
