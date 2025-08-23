import 'package:filler/app.dart';
import 'package:filler/core/logging.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    // Initialize logging for tests
    AppLogger.initialize(isDebug: true);
  });

  testWidgets('App loads without error', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify the app loads and shows the home page
    expect(find.text('Filler'), findsOneWidget);
    expect(find.text('Create New Canvas'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
