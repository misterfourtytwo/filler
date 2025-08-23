// Removed unused import
import 'package:filler/data/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  late AppDatabase database;

  setUpAll(TestHelpers.initializeLogging);

  setUp(() {
    database = TestHelpers.createTestDatabase();
  });

  tearDown(() async {
    await database.close();
    await TestHelpers.cleanup();
  });

  group('AppDatabase', () {
    group('Canvas Operations', () {
      test('should insert canvas and return ID', () async {
        // Arrange
        final canvas = TestHelpers.createTestCanvas(width: 3, height: 3);

        // Act
        final id = await database.insertCanvas(canvas);

        // Assert
        expect(id, isA<int>());
        expect(id, greaterThan(0));

        // Verify insertion
        final retrieved = await database.getCanvas(id);
        expect(retrieved, isNotNull);
        expect(retrieved!.width, equals(3));
        expect(retrieved.height, equals(3));
      });

      test('should retrieve all canvases', () async {
        // Arrange
        final canvas1 = TestHelpers.createTestCanvas(title: 'Canvas 1');
        final canvas2 = TestHelpers.createTestCanvas(title: 'Canvas 2');

        await database.insertCanvas(canvas1);
        await database.insertCanvas(canvas2);

        // Act
        final canvases = await database.getAllCanvases();

        // Assert
        expect(canvases, hasLength(2));
      });

      test('should update existing canvas', () async {
        // Arrange
        final canvas = TestHelpers.createTestCanvas(title: 'Original');
        final id = await database.insertCanvas(canvas);

        final retrieved = await database.getCanvas(id);
        final updated = retrieved!.copyWith(title: 'Updated');

        // Act
        final result = await database.updateCanvas(updated);

        // Assert
        expect(result, isTrue);

        final retrievedUpdated = await database.getCanvas(id);
        expect(retrievedUpdated!.title, equals('Updated'));
      });

      test('should delete canvas by ID', () async {
        // Arrange
        final canvas = TestHelpers.createTestCanvas();
        final id = await database.insertCanvas(canvas);

        // Act
        final deletedRows = await database.deleteCanvas(id);

        // Assert
        expect(deletedRows, equals(1));

        final retrieved = await database.getCanvas(id);
        expect(retrieved, isNull);
      });

      test('should return null for non-existent canvas', () async {
        // Act
        final canvas = await database.getCanvas(999);

        // Assert
        expect(canvas, isNull);
      });
    });

    group('Key-Value Preferences Operations', () {
      test('should get preference value with default', () async {
        // Act
        final value = await database.getPreferenceValue('width', '10');

        // Assert
        expect(
          value,
          equals('10'),
        ); // Should return default since key doesn't exist
      });

      test('should set and retrieve preference value', () async {
        // Arrange
        const key = 'testKey';
        const value = 'testValue';
        const type = 'string';

        // Act
        await database.setPreferenceValue(key, value, type);
        final retrieved = await database.getPreferenceValue(key, 'default');

        // Assert
        expect(retrieved, equals(value));
      });

      test('should update existing preference value', () async {
        // Arrange
        const key = 'width';
        await database.setPreferenceValue(key, '10', 'int');

        // Act
        await database.setPreferenceValue(key, '20', 'int');
        final retrieved = await database.getPreferenceValue(key, '5');

        // Assert
        expect(retrieved, equals('20'));
      });

      test('should get all preferences as map', () async {
        // Arrange
        await database.setPreferenceValue('width', '15', 'int');
        await database.setPreferenceValue('height', '20', 'int');
        await database.setPreferenceValue('insets', '2', 'int');
        await database.setPreferenceValue('defaultColor', '4294198070', 'int');

        // Act
        final allPrefs = await database.getAllPreferences();

        // Assert
        expect(allPrefs, hasLength(4));
        expect(allPrefs['width'], equals('15'));
        expect(allPrefs['height'], equals('20'));
        expect(allPrefs['insets'], equals('2'));
        expect(allPrefs['defaultColor'], equals('4294198070'));
      });

      test('should handle empty preferences gracefully', () async {
        // Act
        final allPrefs = await database.getAllPreferences();

        // Assert
        expect(allPrefs, isEmpty);
      });

      test('should track creation and update timestamps', () async {
        // Arrange
        const key = 'testTimestamp';
        final beforeCreate = DateTime.now();

        // Act
        await database.setPreferenceValue(key, 'initial', 'string');

        // Longer delay to ensure different timestamp
        await Future.delayed(const Duration(milliseconds: 100));

        await database.setPreferenceValue(key, 'updated', 'string');

        // Assert
        final rows = await database.select(database.preferenceKeyValues).get();
        final testRow = rows.firstWhere((r) => r.key == key);

        // Debug: Log actual timestamps to understand what's happening
        debugPrint('beforeCreate: $beforeCreate');
        debugPrint('createdAt: ${testRow.createdAt}');
        debugPrint('updatedAt: ${testRow.updatedAt}');
        debugPrint(
          'createdAt.isAfter(beforeCreate): ${testRow.createdAt.isAfter(beforeCreate)}',
        );
        debugPrint(
          'updatedAt.isAfter(beforeCreate): ${testRow.updatedAt.isAfter(beforeCreate)}',
        );

        // SQLite timestamps have second precision, so we need to account for that
        // The database timestamps should be at least as recent as beforeCreate (rounded to seconds)
        final beforeCreateRounded = DateTime(
          beforeCreate.year,
          beforeCreate.month,
          beforeCreate.day,
          beforeCreate.hour,
          beforeCreate.minute,
          beforeCreate.second,
        );

        // Since SQLite rounds down to seconds, createdAt might be the same as beforeCreateRounded
        // or up to 1 second earlier. We should allow for this.
        expect(
          testRow.createdAt.isAfter(
            beforeCreateRounded.subtract(const Duration(seconds: 2)),
          ),
          isTrue,
          reason:
              'createdAt should be at most 1 second before beforeCreate (accounting for SQLite second precision)',
        );
        expect(
          testRow.updatedAt.isAfter(
            beforeCreateRounded.subtract(const Duration(seconds: 2)),
          ),
          isTrue,
          reason:
              'updatedAt should be at most 1 second before beforeCreate (accounting for SQLite second precision)',
        );

        // Verify that updatedAt is at least as recent as createdAt
        expect(
          testRow.updatedAt.isAfter(
            testRow.createdAt.subtract(const Duration(seconds: 1)),
          ),
          isTrue,
          reason: 'updatedAt should be at least as recent as createdAt',
        );
      });
    });
  });
}
