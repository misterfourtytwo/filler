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

  group('BLoC State Transitions - All Pages', () {
    test('Canvas BLoC - New Canvas State Transitions', () async {
      // Test: initial → loading → ready
      expect(canvasBloc.state, const CanvasState.initial());

      // Trigger initialization
      canvasBloc.add(const CanvasEvent.init());
      await Future.delayed(const Duration(milliseconds: 500));

      // Should be in ready state with defaults
      expect(canvasBloc.state, isA<CanvasState>());
      canvasBloc.state.maybeWhen(
        ready: (w, h, i, c, rotation, customPattern, p, ppc, cbc) {
          expect(w, greaterThan(0));
          expect(h, greaterThan(0));
          expect(p, hasLength(w * h));
          expect(
            ppc,
            equals(const Color(0xFF000000)),
          ); // Default pattern paint color
          expect(
            cbc,
            equals(const Color(0xFFFFFFFF)),
          ); // Default canvas background color
        },
        orElse: () => fail('Canvas should be in ready state'),
      );
    });

    test('Canvas BLoC - Load Existing Canvas State Transitions', () async {
      // First create a canvas to load with pixel data
      const pixelsJson = '[{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0},{"pattern":1,"rotation":0.0}]';
      final canvasId = await canvasRepo.add(
        title: 'Test Canvas',
        width: 8,
        height: 6,
        insets: 2,
        pixelsJson: pixelsJson,
        patternPaintColor: 0xFF000000,
        canvasBackgroundColor: 0xFFFFFFFF,
      );

      // Test: initial → loading → ready with existing data
      expect(canvasBloc.state, const CanvasState.initial());

      canvasBloc.add(CanvasEvent.load(canvasId));
      await Future.delayed(const Duration(milliseconds: 500));

      // Should load existing canvas dimensions, not preferences
      canvasBloc.state.maybeWhen(
        ready: (w, h, i, c, rotation, customPattern, p, ppc, cbc) {
          expect(w, equals(8)); // Existing canvas width
          expect(h, equals(6)); // Existing canvas height
          expect(i, equals(2)); // Existing canvas insets
          expect(p, hasLength(48)); // 8x6 = 48 pixels
          expect(
            p[0].pattern,
            equals(1),
          ); // Existing pixel data (solid pattern)
          expect(
            ppc,
            equals(const Color(0xFF000000)),
          ); // Default pattern paint color
          expect(
            cbc,
            equals(const Color(0xFFFFFFFF)),
          ); // Default canvas background color
        },
        orElse: () => fail('Canvas should be in ready state'),
      );
    });

    test('Gallery BLoC - State Transitions', () async {
      // Test: initial → loading → loaded
      expect(galleryBloc.state, const GalleryState.initial());

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

      // Should be in loaded state with canvases
      expect(galleryBloc.state, isA<GalleryState>());
      galleryBloc.state.maybeWhen(
        loaded: (items) {
          expect(items, hasLength(2));
          expect(items[0].pixels, hasLength(9)); // 3x3
          expect(items[1].pixels, hasLength(4)); // 2x2
        },
        orElse: () => fail('Gallery should be in loaded state'),
      );
    });

    test('Preferences BLoC - State Transitions', () async {
      // Test: initial → loading → ready
      expect(preferencesBloc.state, const PreferencesState.initial());

      // Load preferences
      preferencesBloc.add(const PreferencesEvent.load());
      await Future.delayed(const Duration(milliseconds: 500));

      // Should be in ready state with defaults
      expect(preferencesBloc.state, isA<PreferencesState>());
      preferencesBloc.state.maybeWhen(
        ready: (w, h, i, c, t) {
          expect(w, equals(10)); // Default width
          expect(h, equals(10)); // Default height
          expect(i, equals(0)); // Default insets
          expect(c, equals(1)); // Default pattern
          expect(t, equals(2)); // Default theme mode
        },
        orElse: () => fail('Preferences should be in ready state'),
      );
    });

    test('Preferences BLoC - Update State Transitions', () async {
      // Load preferences first
      preferencesBloc.add(const PreferencesEvent.load());
      await Future.delayed(const Duration(milliseconds: 500));

      // Update width
      preferencesBloc.add(const PreferencesEvent.setWidth(15));
      await Future.delayed(const Duration(milliseconds: 100));

      preferencesBloc.state.maybeWhen(
        ready: (w, h, i, c, t) {
          expect(w, equals(15)); // Updated width
          expect(h, equals(10)); // Unchanged height
          expect(i, equals(0)); // Unchanged insets
          expect(c, equals(1)); // Default pattern
          expect(t, equals(2)); // Default theme mode
        },
        orElse: () => fail('Preferences should be in ready state'),
      );

      // Update height
      preferencesBloc.add(const PreferencesEvent.setHeight(12));
      await Future.delayed(const Duration(milliseconds: 100));

      preferencesBloc.state.maybeWhen(
        ready: (w, h, i, c, t) {
          expect(w, equals(15)); // Previous width
          expect(h, equals(12)); // Updated height
          expect(i, equals(0)); // Unchanged insets
          expect(c, equals(1)); // Default pattern
          expect(t, equals(2)); // Default theme mode
        },
        orElse: () => fail('Preferences should be in ready state'),
      );
    });

    test('Canvas BLoC - Paint State Transitions', () async {
      // Initialize canvas
      canvasBloc.add(const CanvasEvent.init());
      await Future.delayed(const Duration(milliseconds: 500));

      // Change active color
      canvasBloc.add(const CanvasEvent.setActiveColor(2));
      await Future.delayed(const Duration(milliseconds: 100));

      // Paint some pixels
      canvasBloc
        ..add(const CanvasEvent.paint(0))
        ..add(const CanvasEvent.paint(5))
        ..add(const CanvasEvent.paint(10));
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify painted pixels
      canvasBloc.state.maybeWhen(
        ready: (w, h, i, c, rotation, customPattern, p, ppc, cbc) {
          expect(c, equals(2)); // Active color should be 2
          expect(p[0].pattern, equals(2)); // Painted pixel
          expect(p[5].pattern, equals(2)); // Painted pixel
          expect(p[10].pattern, equals(2)); // Painted pixel
          // Other pixels should remain unchanged
          expect(p[1].pattern, equals(0xFF2196F3)); // Default pattern
        },
        orElse: () => fail('Canvas should be in ready state'),
      );
    });

    test('Canvas BLoC - Save State Transitions', () async {
      // Initialize canvas
      canvasBloc.add(const CanvasEvent.init());
      await Future.delayed(const Duration(milliseconds: 500));

      // Paint some pixels
      canvasBloc
        ..add(const CanvasEvent.setActiveColor(3))
        ..add(const CanvasEvent.paint(0))
        ..add(const CanvasEvent.paint(1));
      await Future.delayed(const Duration(milliseconds: 100));

      // Save canvas
      canvasBloc.add(const CanvasEvent.save('Test Save Canvas'));
      await Future.delayed(const Duration(milliseconds: 500));

      // Verify canvas was saved by loading gallery
      galleryBloc.add(const GalleryEvent.load());
      await Future.delayed(const Duration(milliseconds: 500));

      galleryBloc.state.maybeWhen(
        loaded: (items) {
          expect(items, hasLength(1));
          expect(items[0].pixels[0].pattern, equals(3)); // Painted pixel
          expect(items[0].pixels[1].pattern, equals(3)); // Painted pixel
        },
        orElse: () => fail('Gallery should be in loaded state'),
      );
    });
  });
}
