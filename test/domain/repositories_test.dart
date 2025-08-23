import 'package:filler/data/database.dart';
import 'package:filler/domain/repositories.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  late AppDatabase database;
  late CanvasRepository canvasRepo;
  late PreferencesRepository prefsRepo;

  setUp(() {
    database = TestHelpers.createTestDatabase();
    canvasRepo = CanvasRepository(database);
    prefsRepo = PreferencesRepository(database);
  });

  tearDown(() async {
    await TestHelpers.cleanup();
  });

  group('CanvasRepository', () {
    test('should add and retrieve canvas', () async {
      // Add a canvas
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

      // Retrieve the canvas
      final canvas = await canvasRepo.getById(canvasId);
      expect(canvas, isNotNull);
      expect(canvas!.title, equals('Test Canvas'));
      expect(canvas.width, equals(2));
      expect(canvas.height, equals(2));
      expect(canvas.insets, equals(0));
      expect(
        canvas.pixelsJson,
        equals(
          '[{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0}]',
        ),
      );
    });

    test('should get all canvases', () async {
      // Add multiple canvases
      await canvasRepo.add(
        title: 'Canvas 1',
        width: 2,
        height: 2,
        insets: 0,
        pixelsJson:
            '[{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0}]',
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      await canvasRepo.add(
        title: 'Canvas 2',
        width: 3,
        height: 3,
        insets: 1,
        pixelsJson:
            '[{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0},{"pattern":0,"rotation":0.0}]',
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      // Get all canvases
      final canvases = await canvasRepo.getAll();
      expect(canvases.length, equals(2));
      expect(canvases[0].title, equals('Canvas 1'));
      expect(canvases[1].title, equals('Canvas 2'));
    });

    test('should handle missing canvas', () async {
      final canvas = await canvasRepo.getById(999);
      expect(canvas, isNull);
    });
  });

  group('PreferencesRepository', () {
    test('should return default preferences when none exist', () async {
      final preferences = await prefsRepo.get();

      expect(preferences.width, equals(10));
      expect(preferences.height, equals(10));
      expect(preferences.insets, equals(0));
      expect(preferences.defaultPattern, equals(1)); // Default pattern
    });

    test('should save and retrieve preferences', () async {
      // Save preferences
      await prefsRepo.save(
        width: 15,
        height: 20,
        insets: 2,
        defaultPattern: 2,
        themeMode: 2,
      );

      // Retrieve preferences
      final preferences = await prefsRepo.get();

      expect(preferences.width, equals(15));
      expect(preferences.height, equals(20));
      expect(preferences.insets, equals(2));
      expect(preferences.defaultPattern, equals(2));
    });

    test('should update existing preferences', () async {
      // Save initial preferences
      await prefsRepo.save(
        width: 10,
        height: 10,
        insets: 0,
        defaultPattern: 1,
        themeMode: 2,
      );

      // Update preferences
      await prefsRepo.save(
        width: 25,
        height: 30,
        insets: 5,
        defaultPattern: 2,
        themeMode: 1,
      );

      // Retrieve updated preferences
      final preferences = await prefsRepo.get();

      expect(preferences.width, equals(25));
      expect(preferences.height, equals(30));
      expect(preferences.insets, equals(5));
      expect(preferences.defaultPattern, equals(2));
    });

    test('should handle individual preference updates', () async {
      // Set individual preferences
      await prefsRepo.setPreference('width', 12);
      await prefsRepo.setPreference('height', 18);
      await prefsRepo.setPreference('insets', 3);
      await prefsRepo.setPreference('defaultPattern', 3);

      // Retrieve preferences
      final preferences = await prefsRepo.get();

      expect(preferences.width, equals(12));
      expect(preferences.height, equals(18));
      expect(preferences.insets, equals(3));
      expect(preferences.defaultPattern, equals(3));
    });

    test('should handle type conversion for individual preferences', () async {
      // Test integer preference
      final width = await prefsRepo.getPreference<int>('width', 10);
      expect(
        width,
        equals(10),
      ); // Should return default since key doesn't exist

      // Set and retrieve integer preference
      await prefsRepo.setPreference('width', 15);
      final retrievedWidth = await prefsRepo.getPreference<int>('width', 10);
      expect(retrievedWidth, equals(15));

      // Test boolean preference
      await prefsRepo.setPreference('testBool', true);
      final boolValue = await prefsRepo.getPreference<bool>('testBool', false);
      expect(boolValue, equals(true));

      // Test string preference
      await prefsRepo.setPreference('testString', 'test value');
      final stringValue = await prefsRepo.getPreference<String>(
        'testString',
        'default',
      );
      expect(stringValue, equals('test value'));
    });
  });
}
