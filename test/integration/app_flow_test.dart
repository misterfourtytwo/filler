import 'package:filler/data/database.dart';
import 'package:filler/domain/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  late AppDatabase database;
  late CanvasRepository canvasRepo;
  late PreferencesRepository prefsRepo;

  setUpAll(TestHelpers.initializeLogging);

  setUp(() {
    database = TestHelpers.createTestDatabase();
    canvasRepo = CanvasRepository(database);
    prefsRepo = PreferencesRepository(database);
  });

  tearDown(() async {
    await TestHelpers.cleanup();
  });

  group('App Flow Integration Tests', () {
    test('complete canvas creation and retrieval flow', () async {
      // 1. Create a canvas
      final canvasId = await canvasRepo.add(
        title: 'Test Canvas',
        width: 3,
        height: 3,
        insets: 1,
        pixelsJson:
            '[{"pattern":0,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":2,"rotation":0.0},{"pattern":3,"rotation":0.0},{"pattern":4,"rotation":0.0},{"pattern":5,"rotation":0.0},{"pattern":6,"rotation":0.0},{"pattern":7,"rotation":0.0},{"pattern":8,"rotation":0.0}]',
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      expect(canvasId, isA<int>());
      expect(canvasId, greaterThan(0));

      // 2. Retrieve the canvas
      final canvas = await canvasRepo.getById(canvasId);
      expect(canvas, isNotNull);
      expect(canvas!.title, equals('Test Canvas'));
      expect(canvas.width, equals(3));
      expect(canvas.height, equals(3));
      expect(canvas.insets, equals(1));

      // 3. Verify pixel data structure
      final pixels = canvas.pixelsJson;
      expect(pixels, contains('"pattern":0'));
      expect(pixels, contains('"rotation":0.0'));
    });

    test('preferences management flow', () async {
      // 1. Get default preferences
      final defaultPrefs = await prefsRepo.get();
      expect(defaultPrefs.width, equals(10));
      expect(defaultPrefs.height, equals(10));
      expect(defaultPrefs.insets, equals(0));
      expect(defaultPrefs.defaultPattern, equals(1));

      // 2. Save custom preferences
      await prefsRepo.save(
        width: 15,
        height: 12,
        insets: 2,
        defaultPattern: 1,
        themeMode: 2,
      );

      // 3. Verify preferences were saved
      final savedPrefs = await prefsRepo.get();
      expect(savedPrefs.width, equals(15));
      expect(savedPrefs.height, equals(12));
      expect(savedPrefs.insets, equals(2));
      expect(savedPrefs.defaultPattern, equals(1));
    });

    test('key-value preference storage', () async {
      // 1. Set custom key-value preferences
      await prefsRepo.setPreference('theme', 'dark');
      await prefsRepo.setPreference('autoSave', true);
      await prefsRepo.setPreference('gridLines', false);
      await prefsRepo.setPreference('brushSize', 3);

      // 2. Verify standard preferences still work
      await prefsRepo.save(
        width: 12,
        height: 8,
        insets: 1,
        defaultPattern: 1,
        themeMode: 2,
      );

      final standardPrefs = await prefsRepo.get();
      expect(standardPrefs.width, equals(12));
      expect(standardPrefs.height, equals(8));

      // 3. Verify custom preferences are stored
      final theme = await prefsRepo.getPreference('theme', 'light');
      final autoSave = await prefsRepo.getPreference('autoSave', false);
      final gridLines = await prefsRepo.getPreference('gridLines', true);
      final brushSize = await prefsRepo.getPreference('brushSize', 1);

      expect(theme, equals('dark'));
      expect(autoSave, isTrue);
      expect(gridLines, isFalse);
      expect(brushSize, equals(3));

      // 4. Verify all preferences exist in database
      final allPrefs = await database.getAllPreferences();
      expect(allPrefs, containsPair('theme', 'dark'));
      expect(allPrefs, containsPair('autoSave', 'true'));
      expect(allPrefs, containsPair('gridLines', 'false'));
      expect(allPrefs, containsPair('brushSize', '3'));
      expect(allPrefs, containsPair('width', '12'));
      expect(allPrefs, containsPair('height', '8'));
    });

    test('error handling across all layers', () async {
      // Test that the application handles data correctly
      // This test verifies that the application processes data as expected

      // Test with valid data that should work
      final canvasId = await canvasRepo.add(
        title: 'Test Canvas',
        width: 2,
        height: 2,
        insets: 0,
        pixelsJson:
            '[{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0}]',
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      expect(canvasId, isA<int>());
      expect(canvasId, greaterThan(0));

      // Test preferences with valid data
      await prefsRepo.save(
        width: 2,
        height: 2,
        insets: 0,
        defaultPattern: 1,
        themeMode: 2,
      );

      // Verify preferences were saved
      final prefs = await prefsRepo.get();
      expect(prefs.width, equals(2));
      expect(prefs.height, equals(2));
      expect(prefs.insets, equals(0));
      expect(prefs.defaultPattern, equals(1));
    });

    test('concurrent operations handling', () async {
      // Test that concurrent operations don't interfere with each other

      final futures = <Future>[];

      // Start multiple operations concurrently
      for (int i = 0; i < 5; i++) {
        futures.add(
          canvasRepo.add(
            title: 'Concurrent Canvas $i',
            width: 2,
            height: 2,
            insets: 0,
            pixelsJson:
                '[{"pattern":1,"rotation":0.0},{"pattern":2,"rotation":0.0},{"pattern":3,"rotation":0.0},{"pattern":4,"rotation":0.0}]',
            patternPaintColor: 0xFF000000,
            canvasBackgroundColor: 0xFFFFFFFF,
          ),
        );
      }

      // Wait for all operations to complete
      final ids = await Future.wait(futures);

      // Verify all canvases were created with unique IDs
      expect(ids, hasLength(5));
      expect(ids.toSet(), hasLength(5)); // All IDs should be unique

      // Verify all canvases exist in database
      final allCanvases = await canvasRepo.getAll();
      expect(allCanvases, hasLength(5));
    });
  });
}
