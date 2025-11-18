import 'package:flutter_test/flutter_test.dart';
import 'package:konstruktor/app.dart';
import 'package:konstruktor/core/logging.dart';

void main() {
  setUpAll(() {
    // Initialize logging for tests
    AppLogger.initialize(isDebug: true);
  });

  testWidgets('App loads without error', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify the app loads and shows the home page
    expect(find.text('Konstruktor'), findsOneWidget);
    expect(find.text('Create New Canvas'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
