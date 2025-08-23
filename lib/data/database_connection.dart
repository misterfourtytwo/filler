import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:filler/core/logging.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Creates a database connection for mobile/desktop platforms.
LazyDatabase createDatabaseConnection() {
  return LazyDatabase(() async {
    AppLogger.database('Using native SQLite database');
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'filler.sqlite3'));
    return NativeDatabase.createInBackground(file);
  });
}

/// Creates a test database connection for mobile/desktop platforms.
LazyDatabase createTestDatabaseConnection() {
  return LazyDatabase(() async {
    AppLogger.database('Test AppDatabase instance created (in-memory)');
    return NativeDatabase.memory();
  });
}
