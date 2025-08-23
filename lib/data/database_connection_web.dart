import 'package:drift/drift.dart';
import 'package:drift/web.dart'; // TODO: Consider migrating to drift/wasm.dart
import 'package:filler/core/logging.dart';

/// Creates a database connection for web platform.
LazyDatabase createDatabaseConnection() {
  return LazyDatabase(() async {
    AppLogger.database('Using web database (sql.js with IndexedDB storage)');
    return WebDatabase('filler_db');
  });
}

/// Creates a test database connection for web platform.
LazyDatabase createTestDatabaseConnection() {
  return LazyDatabase(() async {
    AppLogger.database('Test AppDatabase instance created (sql.js test)');
    return WebDatabase('filler_test_db');
  });
}
