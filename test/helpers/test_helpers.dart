import 'dart:io';

import 'package:drift/drift.dart';
import 'package:filler/core/logging.dart';
import 'package:filler/data/database.dart';
import 'package:filler/domain/repositories.dart';
import 'package:filler/features/canvas/domain/canvas_model.dart';
import 'package:filler/features/canvas/domain/pixel_data.dart';
import 'package:filler/features/canvas/presentation/canvas_bloc.dart';
import 'package:filler/features/gallery/presentation/gallery_bloc.dart';
import 'package:filler/features/home/presentation/home_page.dart';
import 'package:filler/features/prefs/presentation/preferences_bloc.dart';
import 'package:filler/ui/app_scope.dart';
import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Helper utilities for testing the Filler application.
///
/// Provides common test setup, database creation, and cleanup utilities
/// to ensure consistent test environments across all test files.
class TestHelpers {
  /// Initialize logging for tests.
  static void initializeLogging() {
    AppLogger.initialize(isDebug: true);
  }

  /// Create a test database instance.
  static AppDatabase createTestDatabase() {
    AppLogger.instance.d('🗄️ Creating test database');
    return AppDatabase.test();
  }

  /// Create a test app widget with all dependencies.
  static Widget createTestApp({required Widget home}) {
    AppLogger.instance.d('🏗️ Setting up test app environment');

    final db = createTestDatabase();
    final canvasRepo = CanvasRepository(db);
    final prefsRepo = PreferencesRepository(db);
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);

    AppLogger.instance.d('📱 Test app created with dependencies');

    return AppScope(
      database: db,
      canvasRepository: canvasRepo,
      preferencesRepository: prefsRepo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PreferencesBloc(prefsRepo)),
          BlocProvider(
            create: (_) => CanvasBloc(prefs: prefsRepo, repo: canvasRepo),
          ),
          BlocProvider(create: (_) => GalleryBloc(canvasRepo)),
        ],
        child: MaterialApp(
          title: 'Filler Test',
          theme: DesignSystem.theme(colorScheme),
          home: Builder(
            builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (home is! HomePage) {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => home));
                }
              });
              return const HomePage();
            },
          ),
        ),
      ),
    );
  }

  /// Create a test canvas companion for database testing.
  static CanvasesCompanion createTestCanvas({
    String title = 'Test Canvas',
    int width = 5,
    int height = 5,
    int insets = 1,
    String? pixelsJson,
  }) {
    final defaultPixelsJson = List.generate(
      width * height,
      (index) => '{"pattern":0,"rotation":0.0}', // Empty pattern
    ).join(',');

    AppLogger.instance.d(
      '🎨 Creating test canvas',
      error: {
        'title': title,
        'dimensions': '${width}x$height',
        'insets': insets,
        'pixelCount': width * height,
      },
    );

    return CanvasesCompanion.insert(
      title: Value(title),
      width: width,
      height: height,
      insets: Value(insets),
      pixelsJson: pixelsJson ?? '[$defaultPixelsJson]',
      patternPaintColor: const Value(0xFF000000),
      canvasBackgroundColor: const Value(0xFFFFFFFF),
    );
  }

  /// Create a test canvas model for domain testing.
  static CanvasModel createTestCanvasModel({
    int id = 1,
    String title = 'Test Canvas',
    int width = 5,
    int height = 5,
    int insets = 1,
    List<PixelData>? pixels,
  }) {
    final defaultPixels = List.generate(
      width * height,
      (index) => const PixelData(pattern: 0), // Empty pattern
    );

    AppLogger.instance.d(
      '🎨 Creating test canvas model',
      error: {
        'id': id,
        'title': title,
        'dimensions': '${width}x$height',
        'insets': insets,
        'pixelCount': width * height,
      },
    );

    return CanvasModel(
      id: id,
      title: title,
      width: width,
      height: height,
      insets: insets,
      pixels: pixels ?? defaultPixels,
      patternPaintColor: const Color(0xFF000000),
      canvasBackgroundColor: const Color(0xFFFFFFFF),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Clean up any temporary test files.
  static Future<void> cleanup() async {
    AppLogger.instance.d('🧹 Cleaning up test environment');

    // Clean up any temporary files created during tests
    try {
      final tempDir = Directory.systemTemp;
      final testFiles = tempDir
          .listSync()
          .where((entity) => entity.path.contains('test_'))
          .whereType<File>();

      for (final file in testFiles) {
        await file.delete();
      }

      AppLogger.instance.d('✅ Test cleanup completed');
    } on Exception catch (e) {
      AppLogger.instance.w('⚠️ Test cleanup encountered issues', error: e);
      // Ignore cleanup errors in tests
    }
  }
}
