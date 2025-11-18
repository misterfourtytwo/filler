import 'package:drift/drift.dart';

/// Stub implementation - should never be called.
/// Real implementations are in database_connection_native.dart and database_connection_web.dart
QueryExecutor openConnection({required String name}) {
  throw UnsupportedError(
    'No suitable database implementation found for this platform',
  );
}

/// Opens a test database connection.
QueryExecutor openTestConnection() {
  throw UnsupportedError(
    'No suitable database implementation found for this platform',
  );
}
