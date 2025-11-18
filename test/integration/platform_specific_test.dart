import 'package:filler/data/database.dart';
import 'package:filler/domain/repositories.dart';
import 'package:filler/features/canvas/presentation/canvas_bloc.dart';
import 'package:filler/features/gallery/presentation/gallery_bloc.dart';
import 'package:filler/features/prefs/presentation/preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  late AppDatabase database;
  late CanvasRepository canvasRepo;
  late PreferencesRepository prefsRepo;
  late CanvasBloc canvasBloc;
  late GalleryBloc galleryBloc;
  late PreferencesBloc preferencesBloc;

  setUpAll(TestHelpers.initializeLogging);

  setUp(() {
    database = TestHelpers.createTestDatabase();
    canvasRepo = CanvasRepository(database);
    prefsRepo = PreferencesRepository(database);
    canvasBloc = CanvasBloc(prefs: prefsRepo, repo: canvasRepo);
    galleryBloc = GalleryBloc(canvasRepo);
    preferencesBloc = PreferencesBloc(prefsRepo);
  });

  tearDown(() async {
    await canvasBloc.close();
    await galleryBloc.close();
    await preferencesBloc.close();
    await database.close();
    await TestHelpers.cleanup();
  });

  group('Platform-Specific Database Integration', () {
    test('Database Connection Works on Current Platform', () async {
      // This test verifies the platform-specific database connection works

      // Test basic database operations work regardless of platform
      final testCanvasId = await canvasRepo.add(
        title: 'Platform Test Canvas',
        width: 5,
        height: 5,
        insets: 0,
        pixelsJson:
            '[{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0}]',
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      expect(testCanvasId, greaterThan(0));

      // Verify canvas can be retrieved
      final retrievedCanvas = await canvasRepo.getById(testCanvasId);
      expect(retrievedCanvas, isNotNull);
      expect(retrievedCanvas!.title, equals('Platform Test Canvas'));
      expect(retrievedCanvas.width, equals(5));

      // Test preferences work
      await prefsRepo.save(
        width: 12,
        height: 10,
        insets: 2,
        defaultPattern: 0, // Empty pattern
        themeMode: 2,
      );

      final savedPrefs = await prefsRepo.get();
      expect(savedPrefs.width, equals(12));
      expect(savedPrefs.height, equals(10));
    });

    test('Preferences Persistence Works Cross-Platform', () async {
      // Test preference persistence across database operations

      // Set custom preferences
      await prefsRepo.save(
        width: 15,
        height: 12,
        insets: 3,
        defaultPattern: 0, // Empty pattern
        themeMode: 2,
      );

      // Initialize canvas - should use saved preferences
      canvasBloc.add(const CanvasEvent.init());
      await Future.delayed(const Duration(milliseconds: 500));

      canvasBloc.state.maybeWhen(
        ready: (w, h, i, c, rotation, customPattern, p, ppc, cbc) {
          expect(w, equals(15));
          expect(h, equals(12));
          expect(i, equals(3));
          expect(c, equals(0)); // Default pattern index (empty pattern)
          expect(p, hasLength(180)); // 15x12 = 180
          expect(
            ppc,
            equals(const Color(0xFF000000)),
          ); // Default pattern paint color
          expect(
            cbc,
            equals(const Color(0xFFFFFFFF)),
          ); // Default canvas background color
        },
        orElse: () => fail('Canvas should be ready with custom preferences'),
      );
    });

    test('Canvas Operations Work Cross-Platform', () async {
      // Test canvas operations work consistently across platforms

      // Initialize canvas
      canvasBloc.add(const CanvasEvent.init());
      await Future.delayed(const Duration(milliseconds: 500));

      // Paint some pixels
      canvasBloc
        ..add(const CanvasEvent.setActivePatternId(2))
        ..add(const CanvasEvent.paint(0))
        ..add(const CanvasEvent.paint(5));
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify painted pixels
      canvasBloc.state.maybeWhen(
        ready: (w, h, i, c, rotation, customPattern, p, ppc, cbc) {
          expect(c, equals(2)); // Active color
          expect(p[0].pattern, equals(2)); // Painted pixel
          expect(p[5].pattern, equals(2)); // Painted pixel
        },
        orElse: () => fail('Canvas should be ready with painted pixels'),
      );

      // Save canvas
      canvasBloc.add(const CanvasEvent.save('Platform Test Canvas'));
      await Future.delayed(const Duration(milliseconds: 500));

      // Verify canvas was saved
      final allCanvases = await canvasRepo.getAll();
      expect(allCanvases, hasLength(1));
      expect(allCanvases.first.title, equals('Platform Test Canvas'));
    });

    test('Gallery Operations Work Cross-Platform', () async {
      // Test gallery operations work consistently across platforms

      // Create some test canvases
      await canvasRepo.add(
        title: 'Gallery Test 1',
        width: 3,
        height: 3,
        insets: 0,
        pixelsJson:
            '[{"pattern":0,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":2,"rotation":0.0},{"pattern":3,"rotation":0.0},{"pattern":4,"rotation":0.0},{"pattern":5,"rotation":0.0},{"pattern":6,"rotation":0.0},{"pattern":7,"rotation":0.0},{"pattern":8,"rotation":0.0}]',
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      await canvasRepo.add(
        title: 'Gallery Test 2',
        width: 2,
        height: 2,
        insets: 1,
        pixelsJson:
            '[{"pattern":1,"rotation":0.0},{"pattern":2,"rotation":0.0},{"pattern":3,"rotation":0.0},{"pattern":4,"rotation":0.0}]',
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      // Load gallery
      galleryBloc.add(const GalleryEvent.load());
      await Future.delayed(const Duration(milliseconds: 500));

      // Verify gallery loaded correctly
      galleryBloc.state.maybeWhen(
        loaded: (items) {
          expect(items, hasLength(2));
          expect(items[0].pixels, hasLength(9)); // 3x3
          expect(items[1].pixels, hasLength(4)); // 2x2
        },
        orElse: () => fail('Gallery should be loaded'),
      );
    });

    test('Error Handling Works Cross-Platform', () async {
      // Test error handling works consistently across platforms

      // Test with invalid data
      try {
        await canvasRepo.add(
          title: 'Error Test',
          width: -1, // Invalid width
          height: 2,
          insets: 0,
          pixelsJson: 'invalid-json',
          patternPaintColor: 0xFF000000,
          canvasBackgroundColor: 0xFFFFFFFF,
        );
        fail('Should have thrown an error');
      } on Exception catch (e) {
        // Expected error
        expect(e, isA<Exception>());
      }

      // Test preferences with invalid data
      try {
        await prefsRepo.save(
          width: -1, // Invalid width
          height: 10,
          insets: 0,
          defaultPattern: 0, // Empty pattern
          themeMode: 2,
        );
        fail('Should have thrown an error');
      } on Exception catch (e) {
        // Expected error
        expect(e, isA<Exception>());
      }
    });

    test('Concurrent Operations Work Cross-Platform', () async {
      // Test concurrent operations work consistently across platforms

      final futures = <Future>[];

      // Start multiple operations concurrently
      for (int i = 0; i < 3; i++) {
        futures.add(
          canvasRepo.add(
            title: 'Concurrent Test $i',
            width: 2,
            height: 2,
            insets: 0,
            pixelsJson:
                '[{"pattern":$i,"rotation":0.0},{"pattern":$i,"rotation":0.0},{"pattern":$i,"rotation":0.0},{"pattern":$i,"rotation":0.0}]',
            patternPaintColor: 0xFF000000,
            canvasBackgroundColor: 0xFFFFFFFF,
          ),
        );
      }

      // Wait for all operations to complete
      final ids = await Future.wait(futures);

      // Verify all canvases were created with unique IDs
      expect(ids, hasLength(3));
      expect(ids.toSet(), hasLength(3)); // All IDs should be unique

      // Verify all canvases exist in database
      final allCanvases = await canvasRepo.getAll();
      expect(allCanvases, hasLength(3));
    });
  });
}
