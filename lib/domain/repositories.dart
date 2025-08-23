import 'dart:convert';
import 'package:drift/drift.dart' show Value;
import 'package:filler/core/logging.dart';
import 'package:filler/data/database.dart';
import 'package:filler/features/canvas/domain/canvas_model.dart';
import 'package:filler/features/canvas/domain/pixel_data.dart';
import 'package:filler/features/prefs/domain/preferences_model.dart';
import 'package:flutter/material.dart';

/// Repository providing high-level canvas operations.
///
/// Abstracts database operations for canvas CRUD with business logic.
/// Acts as a boundary between domain and data layers.
class CanvasRepository {
  /// Creates a repository with the given database instance.
  CanvasRepository(this._db);

  /// Database instance for canvas operations.
  final AppDatabase _db;

  /// Retrieves all saved canvases.
  Future<List<Canvase>> getAll() async {
    AppLogger.database('Fetching all canvases');
    final stopwatch = Stopwatch()..start();
    try {
      final canvases = await _db.getAllCanvases();
      stopwatch.stop();
      AppLogger.database(
        'Retrieved canvases',
        data: {
          'count': canvases.length,
          'queryTime': '${stopwatch.elapsed.inMilliseconds}ms',
        },
      );
      return canvases;
    } on Exception catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.error(
        'Failed to fetch canvases',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Gets a specific canvas by ID, null if not found.
  Future<Canvase?> getById(int id) async {
    AppLogger.database('Fetching canvas by ID', data: {'id': id});
    try {
      final canvas = await _db.getCanvas(id);
      AppLogger.database(
        'Canvas fetch result',
        data: {'id': id, 'found': canvas != null, 'title': canvas?.title},
      );
      return canvas;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to fetch canvas by ID',
        error: e,
        stackTrace: stackTrace,
        data: {'id': id},
      );
      rethrow;
    }
  }

  /// Creates a new canvas with the given parameters and returns its ID.
  Future<int> add({
    required String title,
    required int width,
    required int height,
    required int insets,
    required String pixelsJson,
    required int patternPaintColor,
    required int canvasBackgroundColor,
  }) async {
    AppLogger.database(
      'Creating new canvas',
      data: {
        'title': title,
        'dimensions': '${width}x$height',
        'insets': insets,
        'dataSize': '${pixelsJson.length} chars',
      },
    );

    try {
      final stopwatch = Stopwatch()..start();
      final canvasId = await _db.insertCanvas(
        CanvasesCompanion(
          title: Value(title),
          width: Value(width),
          height: Value(height),
          insets: Value(insets),
          pixelsJson: Value(pixelsJson),
          patternPaintColor: Value(patternPaintColor),
          canvasBackgroundColor: Value(canvasBackgroundColor),
        ),
      );
      stopwatch.stop();

      AppLogger.database(
        'Canvas created successfully',
        data: {
          'id': canvasId,
          'title': title,
          'insertTime': '${stopwatch.elapsed.inMilliseconds}ms',
        },
      );

      return canvasId;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to create canvas',
        error: e,
        stackTrace: stackTrace,
        data: {'title': title, 'dimensions': '${width}x$height'},
      );
      rethrow;
    }
  }

  /// Updates an existing canvas, returns true if successful.
  Future<bool> update(Canvase canvas) async {
    AppLogger.database(
      'Updating canvas',
      data: {
        'id': canvas.id,
        'title': canvas.title,
        'dimensions': '${canvas.width}x${canvas.height}',
      },
    );

    try {
      final result = await _db.updateCanvas(canvas);
      AppLogger.database(
        'Canvas update result',
        data: {'id': canvas.id, 'success': result},
      );
      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to update canvas',
        error: e,
        stackTrace: stackTrace,
        data: {'id': canvas.id, 'title': canvas.title},
      );
      rethrow;
    }
  }

  /// Deletes a canvas by ID, returns number of affected rows.
  Future<int> remove(int id) async {
    AppLogger.database('Deleting canvas', data: {'id': id});

    try {
      final affectedRows = await _db.deleteCanvas(id);
      AppLogger.database(
        'Canvas deletion result',
        data: {
          'id': id,
          'affectedRows': affectedRows,
          'success': affectedRows > 0,
        },
      );
      return affectedRows;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete canvas',
        error: e,
        stackTrace: stackTrace,
        data: {'id': id},
      );
      rethrow;
    }
  }

  /// Converts a database entity to a domain model.
  CanvasModel _toDomainModel(Canvase entity) {
    // Decode pixel data from JSON - handle both old and new formats
    final rawPixels = jsonDecode(entity.pixelsJson) as List;
    final pixels = rawPixels.map((pixel) {
      if (pixel is int) {
        // Old format: just pattern index
        return PixelData(pattern: pixel);
      } else if (pixel is Map<String, dynamic>) {
        // New format: pattern and rotation
        return PixelData.fromJson(pixel);
      } else {
        // Fallback
        return PixelData(pattern: 0);
      }
    }).toList();

    return CanvasModel(
      id: entity.id,
      title: entity.title,
      width: entity.width,
      height: entity.height,
      insets: entity.insets,
      pixels: pixels,
      patternPaintColor: Color(
        entity.patternPaintColor == 0 ? 0xFF000000 : entity.patternPaintColor,
      ), // Fallback to black if zero or null
      canvasBackgroundColor: Color(
        entity.canvasBackgroundColor == 0
            ? 0xFFFFFFFF
            : entity.canvasBackgroundColor,
      ), // Fallback to white if zero or null
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Converts a domain model to a database companion for insertion.
  CanvasesCompanion _toDatabaseCompanion(CanvasModel model) {
    // Encode pixel data to JSON
    final pixelsJson = jsonEncode(
      model.pixels.map((pixel) => pixel.toJson()).toList(),
    );

    return CanvasesCompanion(
      title: Value(model.title),
      width: Value(model.width),
      height: Value(model.height),
      insets: Value(model.insets),
      pixelsJson: Value(pixelsJson),
      patternPaintColor: Value(model.patternPaintColor.toARGB32()),
      canvasBackgroundColor: Value(model.canvasBackgroundColor.toARGB32()),
    );
  }

  /// Converts a domain model to a database entity for updates.
  Canvase _toDatabaseEntity(CanvasModel model) {
    // Encode pixel data to JSON
    final pixelsJson = jsonEncode(
      model.pixels.map((pixel) => pixel.toJson()).toList(),
    );

    return Canvase(
      id: model.id,
      title: model.title,
      width: model.width,
      height: model.height,
      insets: model.insets,
      pixelsJson: pixelsJson,
      patternPaintColor: model.patternPaintColor.toARGB32(),
      canvasBackgroundColor: model.canvasBackgroundColor.toARGB32(),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  /// Gets a canvas as a domain model by ID.
  Future<CanvasModel?> getModelById(int id) async {
    AppLogger.database('Fetching canvas model by ID', data: {'id': id});
    try {
      final entity = await _db.getCanvas(id);
      if (entity == null) return null;

      final model = _toDomainModel(entity);
      AppLogger.database(
        'Canvas model fetch result',
        data: {'id': id, 'found': true, 'title': model.title},
      );
      return model;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to fetch canvas model by ID',
        error: e,
        stackTrace: stackTrace,
        data: {'id': id},
      );
      rethrow;
    }
  }

  /// Gets all canvases as domain models.
  Future<List<CanvasModel>> getAllModels() async {
    AppLogger.database('Fetching all canvas models');
    final stopwatch = Stopwatch()..start();
    try {
      final entities = await _db.getAllCanvases();
      final models = entities.map(_toDomainModel).toList();
      stopwatch.stop();

      AppLogger.database(
        'Retrieved canvas models',
        data: {
          'count': models.length,
          'queryTime': '${stopwatch.elapsed.inMilliseconds}ms',
        },
      );
      return models;
    } on Exception catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.error(
        'Failed to fetch canvas models',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Creates a new canvas from a domain model and returns its ID.
  Future<int> addModel(CanvasModel model) async {
    AppLogger.database(
      'Creating new canvas from model',
      data: {
        'title': model.title,
        'dimensions': '${model.width}x${model.height}',
        'pixelCount': model.pixels.length,
      },
    );

    try {
      final stopwatch = Stopwatch()..start();
      final companion = _toDatabaseCompanion(model);
      final canvasId = await _db.insertCanvas(companion);
      stopwatch.stop();

      AppLogger.database(
        'Canvas model created successfully',
        data: {
          'id': canvasId,
          'title': model.title,
          'insertTime': '${stopwatch.elapsed.inMilliseconds}ms',
        },
      );

      return canvasId;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to create canvas from model',
        error: e,
        stackTrace: stackTrace,
        data: {
          'title': model.title,
          'dimensions': '${model.width}x${model.height}',
        },
      );
      rethrow;
    }
  }

  /// Updates an existing canvas from a domain model.
  Future<bool> updateModel(CanvasModel model) async {
    AppLogger.database(
      'Updating canvas from model',
      data: {
        'id': model.id,
        'title': model.title,
        'dimensions': '${model.width}x${model.height}',
      },
    );

    try {
      final entity = _toDatabaseEntity(model);
      final result = await _db.updateCanvas(entity);
      AppLogger.database(
        'Canvas model update result',
        data: {'id': model.id, 'success': result},
      );
      return result;
    } on Exception catch (e, stackTrace) {
      AppLogger.error(
        'Failed to update canvas from model',
        error: e,
        stackTrace: stackTrace,
        data: {'id': model.id, 'title': model.title},
      );
      rethrow;
    }
  }
}

/// Repository for managing user preferences using key-value storage.
///
/// Handles default canvas settings with flexible key-value pairs that
/// allow adding new preferences without database schema migrations.
class PreferencesRepository {
  /// Creates a repository with the given database instance.
  PreferencesRepository(this._db);

  /// Database instance for preferences operations.
  final AppDatabase _db;

  /// Default preference values.
  static const Map<String, dynamic> _defaults = {
    'width': 10,
    'height': 10,
    'insets': 0,
    'defaultPattern': 1,
    'themeMode': 2, // 0=light, 1=dark, 2=system
  };

  /// Gets current preferences, creating defaults if needed.
  Future<PreferencesModel> get() async {
    AppLogger.preferences('Fetching preferences from key-value store');
    final stopwatch = Stopwatch()..start();

    try {
      final allPrefs = await _db.getAllPreferences();
      stopwatch.stop();

      // Get individual values with defaults
      final width = _getIntValue(allPrefs, 'width', _defaults['width']! as int);
      final height = _getIntValue(
        allPrefs,
        'height',
        _defaults['height']! as int,
      );
      final insets = _getIntValue(
        allPrefs,
        'insets',
        _defaults['insets']! as int,
      );
      final defaultPattern = _getIntValue(
        allPrefs,
        'defaultPattern',
        _defaults['defaultPattern']! as int,
      );
      final themeMode = _getIntValue(
        allPrefs,
        'themeMode',
        _defaults['themeMode']! as int,
      );

      // Ensure any missing keys are saved with defaults
      await _ensureDefaults(allPrefs);

      final model = PreferencesModel(
        width: width,
        height: height,
        insets: insets,
        defaultPattern: defaultPattern,
        themeMode: themeMode,
      );

      AppLogger.preferences(
        'Constructed preferences model',
        data: {
          'width': width,
          'height': height,
          'insets': insets,
          'defaultPattern': defaultPattern,
          'themeMode': themeMode,
          'fetchTime': '${stopwatch.elapsed.inMilliseconds}ms',
          'keysFromDb': allPrefs.length,
        },
      );

      return model;
    } catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.error(
        'Failed to fetch preferences',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Helper to get integer value from preferences map.
  int _getIntValue(Map<String, String> prefs, String key, int defaultValue) {
    final stringValue = prefs[key];
    if (stringValue == null) {
      AppLogger.preferences(
        'Using default for missing key',
        data: {'key': key, 'defaultValue': defaultValue},
      );
      return defaultValue;
    }

    try {
      return int.parse(stringValue);
    } on FormatException {
      AppLogger.warning(
        'Invalid preference value, using default',
        data: {
          'key': key,
          'invalidValue': stringValue,
          'defaultValue': defaultValue,
        },
      );
      return defaultValue;
    }
  }

  /// Ensures all default keys exist in the database.
  Future<void> _ensureDefaults(Map<String, String> existing) async {
    for (final entry in _defaults.entries) {
      if (!existing.containsKey(entry.key)) {
        AppLogger.preferences(
          'Creating missing default preference',
          data: {'key': entry.key, 'value': entry.value},
        );

        await _db.setPreferenceValue(
          entry.key,
          entry.value.toString(),
          entry.value is int ? 'int' : 'string',
        );
      }
    }
  }

  /// Saves new preference values using key-value storage.
  Future<void> save({
    required int width,
    required int height,
    required int insets,
    required int defaultPattern,
    required int themeMode,
  }) async {
    AppLogger.preferences(
      'Saving preferences to key-value store',
      data: {
        'width': width,
        'height': height,
        'insets': insets,
        'defaultPattern': defaultPattern,
        'themeMode': themeMode,
      },
    );

    try {
      final stopwatch = Stopwatch()..start();

      // Save each preference as a separate key-value pair
      await Future.wait([
        _db.setPreferenceValue('width', width.toString(), 'int'),
        _db.setPreferenceValue('height', height.toString(), 'int'),
        _db.setPreferenceValue('insets', insets.toString(), 'int'),
        _db.setPreferenceValue(
          'defaultPattern',
          defaultPattern.toString(),
          'int',
        ),
        _db.setPreferenceValue('themeMode', themeMode.toString(), 'int'),
      ]);

      stopwatch.stop();

      AppLogger.preferences(
        'All preferences saved successfully',
        data: {
          'saveTime': '${stopwatch.elapsed.inMilliseconds}ms',
          'keysUpdated': [
            'width',
            'height',
            'insets',
            'defaultPattern',
            'themeMode',
          ],
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to save preferences',
        error: e,
        stackTrace: stackTrace,
        data: {
          'width': width,
          'height': height,
          'insets': insets,
          'defaultPattern': defaultPattern,
          'themeMode': themeMode,
        },
      );
      rethrow;
    }
  }

  /// Sets a single preference value by key.
  Future<void> setPreference<T>(String key, T value) async {
    final valueType = T == int
        ? 'int'
        : T == bool
        ? 'bool'
        : 'string';

    AppLogger.preferences(
      'Setting individual preference',
      data: {'key': key, 'value': value, 'type': valueType},
    );

    await _db.setPreferenceValue(key, value.toString(), valueType);
  }

  /// Gets a single preference value by key with type conversion.
  Future<T> getPreference<T>(String key, T defaultValue) async {
    final stringValue = await _db.getPreferenceValue(
      key,
      defaultValue.toString(),
    );

    if (T == int) {
      return int.tryParse(stringValue) as T? ?? defaultValue;
    } else if (T == bool) {
      return (stringValue.toLowerCase() == 'true') as T? ?? defaultValue;
    } else {
      return stringValue as T;
    }
  }
}
