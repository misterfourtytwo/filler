import 'package:logger/logger.dart';

/// Centralized logging configuration for the application.
///
/// Provides structured logging with different levels and consistent
/// formatting across all components. Uses the logger package for
/// flexible output and filtering capabilities.
class AppLogger {
  static late final Logger _logger;

  /// Initialize the logger with appropriate configuration.
  ///
  /// Should be called once at app startup to configure logging
  /// behavior for the entire application.
  static void initialize({bool isDebug = false}) {
    _logger = Logger(
      filter: isDebug ? DevelopmentFilter() : ProductionFilter(),
      printer: PrettyPrinter(
        // colors, emojis are true by default
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    );

    _logger.i('🚀 AppLogger initialized (debug: $isDebug)');
  }

  /// Get the configured logger instance.
  static Logger get instance => _logger;

  // Convenience methods for common logging patterns

  /// Log navigation events.
  static void navigation(String action, {Map<String, dynamic>? data}) {
    _logger.i('🧭 Navigation: $action', error: data);
  }

  /// Log BLoC state changes.
  static void bloc(
    String blocName,
    String event,
    String? fromState,
    String toState,
  ) {
    _logger.d('🔄 BLoC[$blocName]: $event | $fromState → $toState');
  }

  /// Log database operations.
  static void database(String operation, {Map<String, dynamic>? data}) {
    _logger.d('💾 Database: $operation', error: data);
  }

  /// Log user interactions.
  static void interaction(String action, {Map<String, dynamic>? data}) {
    _logger.d('👆 Interaction: $action', error: data);
  }

  /// Log canvas operations.
  static void canvas(String operation, {Map<String, dynamic>? data}) {
    _logger.d('🎨 Canvas: $operation', error: data);
  }

  /// Log preference changes.
  static void preferences(String operation, {Map<String, dynamic>? data}) {
    _logger.d('⚙️ Preferences: $operation', error: data);
  }

  /// Log export operations.
  static void export(String operation, {Map<String, dynamic>? data}) {
    _logger.i('📤 Export: $operation', error: data);
  }

  /// Log gallery operations.
  static void gallery(String operation, {Map<String, dynamic>? data}) {
    _logger.d('🖼️ Gallery: $operation', error: data);
  }

  /// Log theme operations.
  static void theme(String operation, {Map<String, dynamic>? data}) {
    _logger.d('🎨 Theme: $operation', error: data);
  }

  /// Log file operations.
  static void file(String operation, {Map<String, dynamic>? data}) {
    _logger.d('📁 File: $operation', error: data);
  }

  /// Log network operations.
  static void network(String operation, {Map<String, dynamic>? data}) {
    _logger.d('🌐 Network: $operation', error: data);
  }

  /// Log security operations.
  static void security(String operation, {Map<String, dynamic>? data}) {
    _logger.w('🔒 Security: $operation', error: data);
  }

  /// Log cache operations.
  static void cache(String operation, {Map<String, dynamic>? data}) {
    _logger.d('💿 Cache: $operation', error: data);
  }

  /// Log analytics events.
  static void analytics(String event, {Map<String, dynamic>? data}) {
    _logger.i('📊 Analytics: $event', error: data);
  }

  /// Log errors with full context.
  static void error(
    String message, {
    dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? data,
  }) {
    _logger.e('❌ Error: $message', error: error, stackTrace: stackTrace);
    if (data != null) {
      _logger.e('Context: $data');
    }
  }

  /// Log warnings.
  static void warning(String message, {Map<String, dynamic>? data}) {
    _logger.w('⚠️ Warning: $message', error: data);
  }

  /// Log performance metrics.
  static void performance(
    String operation,
    Duration duration, {
    Map<String, dynamic>? data,
  }) {
    _logger.i(
      '⏱️ Performance: $operation took ${duration.inMilliseconds}ms',
      error: data,
    );
  }

  /// Log memory usage.
  static void memory(String operation, {Map<String, dynamic>? data}) {
    _logger.d('🧠 Memory: $operation', error: data);
  }

  /// Log lifecycle events.
  static void lifecycle(String event, {Map<String, dynamic>? data}) {
    _logger.i('🔄 Lifecycle: $event', error: data);
  }

  /// Log configuration changes.
  static void config(String change, {Map<String, dynamic>? data}) {
    _logger.i('⚙️ Config: $change', error: data);
  }

  /// Log debugging information.
  static void debug(String message, {Map<String, dynamic>? data}) {
    _logger.d('🐛 Debug: $message', error: data);
  }

  /// Log information messages.
  static void info(String message, {Map<String, dynamic>? data}) {
    _logger.i('ℹ️ Info: $message', error: data);
  }

  /// Log verbose messages.
  static void verbose(String message, {Map<String, dynamic>? data}) {
    _logger.t('🔍 Verbose: $message', error: data);
  }
}
