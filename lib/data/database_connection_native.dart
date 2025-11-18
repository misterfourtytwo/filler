import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Native (iOS, Android, macOS, Linux, Windows) database connection.
/// Uses SQLite via FFI for production and in-memory database for tests.
QueryExecutor openConnection({required String name}) {
  return driftDatabase(
    name: name,
    native: const DriftNativeOptions(
      // By default, stores database files in getApplicationDocumentsDirectory()
    ),
  );
}

/// Opens an in-memory database for testing.
/// Fast, isolated, and automatically cleaned up.
QueryExecutor openTestConnection() {
  return NativeDatabase.memory();
}
