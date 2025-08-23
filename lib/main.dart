import 'dart:async';

import 'package:filler/app.dart';
import 'package:filler/core/logging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Entry point for the Filler pixel canvas application.
void main() {
  // Initialize logging system
  AppLogger.initialize(isDebug: kDebugMode);
  AppLogger.instance.i('🎯 Starting Filler application');

  // Setup global error handling
  FlutterError.onError = (details) {
    AppLogger.error(
      'Flutter framework error',
      error: details.exception,
      stackTrace: details.stack,
      data: {
        'library': details.library,
        'context': details.context?.toString(),
        'silent': details.silent,
      },
    );
  };

  // Run the app with error handling
  runZonedGuarded(
    () {
      runApp(const MyApp());
      AppLogger.instance.i('✅ Filler application started successfully');
    },
    (error, stackTrace) {
      AppLogger.error(
        'Uncaught application error',
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}

/// Root widget that bootstraps the application.
///
/// Simply delegates to the main App widget which handles all
/// dependency injection, theming, and routing setup.
class MyApp extends StatelessWidget {
  /// Creates the root application widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
