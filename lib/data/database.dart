import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:konstruktor/core/logging.dart';
part 'database.g.dart';

/// Table definition for storing canvas data.
///
/// Each canvas has dimensions (width/height), optional insets for padding,
/// pixel data stored as JSON, and canvas-specific colors.
/// Timestamps track creation and updates.
class Canvases extends Table {
  /// Primary key, auto-incrementing ID.
  IntColumn get id => integer().autoIncrement()();

  /// Canvas title, defaults to 'Untitled'.
  TextColumn get title => text().withDefault(const Constant('Untitled'))();

  /// Canvas width in pixels.
  IntColumn get width => integer()();

  /// Canvas height in pixels.
  IntColumn get height => integer()();

  /// Canvas padding/insets, defaults to 0.
  IntColumn get insets => integer().withDefault(const Constant(0))();

  /// JSON-serialized pixel data with pattern indices and rotations.
  TextColumn get pixelsJson => text()();

  /// Color to use for painting patterns, stored as ARGB integer.
  IntColumn get patternPaintColor =>
      integer().withDefault(const Constant(0xFF000000))();

  /// Background color for the canvas, stored as ARGB integer.
  IntColumn get canvasBackgroundColor =>
      integer().withDefault(const Constant(0xFFFFFFFF))();

  /// Creation timestamp.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// Last update timestamp.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// Key-value table for storing flexible user preferences.
///
/// Stores preferences as key-value pairs allowing easy extension
/// without database schema migrations. Keys are preference names
/// like 'width', 'height', 'insets', 'defaultColor'.
class PreferenceKeyValues extends Table {
  /// Preference key (e.g., 'width', 'height', 'insets', 'defaultColor').
  TextColumn get key => text().withLength(min: 1, max: 50)();

  /// Preference value stored as string (parsed based on key type).
  TextColumn get value => text()();

  /// Preference value type for proper parsing ('int', 'string', 'bool').
  TextColumn get valueType => text().withDefault(const Constant('string'))();

  /// Creation timestamp.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  /// Last update timestamp.
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {key};
}

/// Main application database using Drift ORM.
///
/// Manages canvas storage and user preferences with SQLite backend.
/// Provides typed queries and migrations through code generation.
/// Uses singleton pattern to prevent multiple database instances.
@DriftDatabase(tables: [Canvases, PreferenceKeyValues])
class AppDatabase extends _$AppDatabase {
  /// Private constructor for singleton pattern.
  AppDatabase._() : super(_openConnection()) {
    AppLogger.database('AppDatabase singleton instance created');
  }

  /// Creates a test database instance with platform-appropriate database.
  AppDatabase.test() : super(_openConnection(test: true));
  static QueryExecutor _openConnection({bool test = false}) {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        // databaseDirectory: getApplicationSupportDirectory,
      ),
      web: DriftWebOptions(
        sqlite3Wasm: test
            ? Uri.parse('sqlite3.debug.wasm')
            : Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
      ),
    );
  }

  static AppDatabase? _instance;

  /// Gets the singleton database instance.
  static AppDatabase get instance {
    _instance ??= AppDatabase._();
    return _instance!;
  }

  /// Resets the singleton instance (mainly for testing).
  static void reset() {
    if (_instance != null) {
      _instance!.close();
      _instance = null;
    }
  }

  @override
  int get schemaVersion => 4; // Updated for canvas-specific colors

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (migrator, from, to) async {
      AppLogger.database(
        'Running database migration',
        data: {'fromVersion': from, 'toVersion': to},
      );

      if (from <= 1 && to >= 2) {
        // Migration from v1 to v2: Add PreferenceKeyValues table
        await migrator.createTable(preferenceKeyValues);

        AppLogger.database(
          'Created PreferenceKeyValues table during migration',
        );

        // If there was an old preferences table, we would migrate data here
        // For now, we'll let the repository create default values on first access
      }

      if (from <= 2 && to >= 3) {
        // Migration from v2 to v3: Update pixel data format to support rotations
        AppLogger.database(
          'Migrating pixel data format to support pattern rotations',
        );

        // Get all existing canvases
        final existingCanvases = await select(canvases).get();

        for (final canvas in existingCanvases) {
          try {
            // Parse existing pixel data (old format: List<int>)
            final oldPixels = (jsonDecode(canvas.pixelsJson) as List)
                .cast<int>();

            // Convert to new format: List<Map<String, dynamic>> with pattern and rotation
            final newPixels = oldPixels
                .map(
                  (patternIndex) => {
                    'pattern': patternIndex,
                    'rotation': 0.0, // Default rotation for existing canvases
                  },
                )
                .toList();

            // Update the canvas with new format
            await (update(
              canvases,
            )..where((t) => t.id.equals(canvas.id))).write(
              CanvasesCompanion(
                pixelsJson: Value(jsonEncode(newPixels)),
                updatedAt: Value(DateTime.now()),
              ),
            );

            AppLogger.database(
              'Migrated canvas pixel data',
              data: {
                'canvasId': canvas.id,
                'pixelCount': oldPixels.length,
                'oldFormat': 'List<int>',
                'newFormat': 'List<Map<String, dynamic>>',
              },
            );
          } on Exception catch (e, stackTrace) {
            AppLogger.error(
              'Failed to migrate canvas pixel data',
              error: e,
              stackTrace: stackTrace,
              data: {'canvasId': canvas.id},
            );
          }
        }

        AppLogger.database(
          'Completed pixel data migration to rotation format',
          data: {'migratedCanvases': existingCanvases.length},
        );
      }

      if (from <= 3 && to >= 4) {
        // Migration from v3 to v4: Add canvas-specific color columns
        AppLogger.database('Adding canvas-specific color columns');

        // Add the new color columns to existing canvases table
        await migrator.addColumn(canvases, canvases.patternPaintColor);
        await migrator.addColumn(canvases, canvases.canvasBackgroundColor);

        // Update existing canvases with default color values
        await customStatement(
          'UPDATE canvases SET pattern_paint_color = ? WHERE pattern_paint_color IS NULL',
          [0xFF000000], // Default black color
        );
        await customStatement(
          'UPDATE canvases SET canvas_background_color = ? WHERE canvas_background_color IS NULL',
          [0xFFFFFFFF], // Default white color
        );

        AppLogger.database('Completed canvas color columns migration');
      }
    },
    beforeOpen: (details) async {
      AppLogger.database(
        'Database opened',
        data: {
          'version': details.versionNow,
          'wasCreated': details.wasCreated,
          'hadUpgrade': details.hadUpgrade,
        },
      );
    },
  );

  // CRUD operations for canvases
  /// Inserts a new canvas and returns the generated ID.
  Future<int> insertCanvas(CanvasesCompanion entry) async {
    AppLogger.database(
      'Inserting canvas',
      data: {
        'title': entry.title.value,
        'dimensions': '${entry.width.value}x${entry.height.value}',
      },
    );
    try {
      final id = await into(canvases).insert(entry);
      AppLogger.database('Canvas inserted with ID', data: {'id': id});
      return id;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to insert canvas',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Retrieves all canvases ordered by creation date.
  Future<List<Canvase>> getAllCanvases() async {
    AppLogger.database('Querying all canvases');
    try {
      final result = await select(canvases).get();
      AppLogger.database('Query completed', data: {'count': result.length});
      return result;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to query canvases',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Finds a canvas by ID, returns null if not found.
  Future<Canvase?> getCanvas(int id) =>
      (select(canvases)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Updates an existing canvas, returns true if successful.
  Future<bool> updateCanvas(Canvase entity) => update(canvases).replace(entity);

  /// Deletes a canvas by ID, returns number of affected rows.
  Future<int> deleteCanvas(int id) =>
      (delete(canvases)..where((t) => t.id.equals(id))).go();

  // Key-value preferences management
  /// Gets a preference value by key, returns default if not found.
  Future<String> getPreferenceValue(String key, String defaultValue) async {
    AppLogger.database(
      'Getting preference value',
      data: {'key': key, 'defaultValue': defaultValue},
    );

    final result = await (select(
      preferenceKeyValues,
    )..where((t) => t.key.equals(key))).getSingleOrNull();

    final value = result?.value ?? defaultValue;
    AppLogger.database(
      'Retrieved preference',
      data: {'key': key, 'value': value, 'wasDefault': result == null},
    );

    return value;
  }

  /// Sets a preference value, creating or updating the key.
  Future<void> setPreferenceValue(
    String key,
    String value,
    String valueType,
  ) async {
    AppLogger.database(
      'Setting preference value',
      data: {'key': key, 'value': value, 'type': valueType},
    );

    try {
      // Check if the preference already exists
      final existing = await (select(
        preferenceKeyValues,
      )..where((t) => t.key.equals(key))).getSingleOrNull();

      if (existing != null) {
        // Update existing preference
        await (update(
          preferenceKeyValues,
        )..where((t) => t.key.equals(key))).write(
          PreferenceKeyValuesCompanion(
            value: Value(value),
            valueType: Value(valueType),
            updatedAt: Value(DateTime.now()),
          ),
        );
      } else {
        // Insert new preference
        final now = DateTime.now();
        await into(preferenceKeyValues).insert(
          PreferenceKeyValuesCompanion.insert(
            key: key,
            value: value,
            valueType: Value(valueType),
            createdAt: Value(now),
            updatedAt: Value(now),
          ),
        );
      }

      AppLogger.database(
        'Preference value saved',
        data: {'key': key, 'value': value},
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to set preference value',
        error: e,
        stackTrace: stackTrace,
        data: {'key': key, 'value': value},
      );
      rethrow;
    }
  }

  /// Gets all preference key-value pairs.
  Future<Map<String, String>> getAllPreferences() async {
    AppLogger.database('Fetching all preferences');

    try {
      final rows = await select(preferenceKeyValues).get();
      final preferences = <String, String>{};

      for (final row in rows) {
        preferences[row.key] = row.value;
      }

      AppLogger.database(
        'Retrieved all preferences',
        data: {'count': preferences.length, 'keys': preferences.keys.toList()},
      );

      return preferences;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to fetch all preferences',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
