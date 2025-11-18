import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Web database connection using WASM and IndexedDB.
/// Works in browsers with proper MIME type configuration.
QueryExecutor openConnection({required String name}) {
  return driftDatabase(
    name: name,
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}

/// Opens a test database for web platform.
/// Uses a unique name for isolation between tests.
QueryExecutor openTestConnection() {
  // Use unique database name for test isolation
  final testName = 'test_db_${DateTime.now().microsecondsSinceEpoch}';
  return driftDatabase(
    name: testName,
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.debug.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
