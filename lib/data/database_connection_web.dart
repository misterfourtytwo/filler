import 'package:drift/drift.dart';
// Using the new WASM approach instead of deprecated web.dart
// See: https://drift.simonbinder.eu/web
import 'package:drift/wasm.dart';
import 'package:filler/core/logging.dart';

/// Creates a database connection for web platform.
LazyDatabase createDatabaseConnection() {
  return LazyDatabase(() async {
    AppLogger.database(
      'Using WASM database (sqlite3 WASM with IndexedDB storage)',
    );

    // Use main thread approach to avoid worker issues
    final result = await WasmDatabase.open(
      databaseName: 'filler_db',
      sqlite3Uri: Uri.parse('/sql-wasm.wasm'),
      // Use a dummy URI for worker to satisfy the API requirement
      // The worker won't actually be used since we're running in main thread
      driftWorkerUri: Uri.parse('/dummy-worker.js'),
    );
    return result.resolvedExecutor;
  });
}

/// Creates a test database connection for web platform.
LazyDatabase createTestDatabaseConnection() {
  return LazyDatabase(() async {
    AppLogger.database('Test AppDatabase instance created (WASM test)');

    final result = await WasmDatabase.open(
      databaseName: 'filler_test_db',
      sqlite3Uri: Uri.parse('/sql-wasm.wasm'),
      // Use a dummy URI for worker to satisfy the API requirement
      driftWorkerUri: Uri.parse('/dummy-worker.js'),
    );
    return result.resolvedExecutor;
  });
}
