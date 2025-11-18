import 'package:flutter/material.dart';
import 'package:konstruktor/data/database.dart';
import 'package:konstruktor/domain/repositories.dart';

/// Dependency injection container using InheritedWidget.
///
/// Provides database and repositories to the widget tree, enabling
/// clean dependency injection without service locators. BLoCs can
/// access dependencies via `context.read<AppScope>()`.
class AppScope extends InheritedWidget {
  /// Creates an AppScope with required dependencies.
  const AppScope({
    required this.database,
    required this.canvasRepository,
    required this.preferencesRepository,
    required super.child,
    super.key,
  });

  /// Drift database instance.
  final AppDatabase database;

  /// Repository for canvas entities.
  final CanvasRepository canvasRepository;

  /// Repository for user preferences.
  final PreferencesRepository preferencesRepository;

  /// Retrieves the nearest AppScope from the widget tree.
  ///
  /// Throws an assertion error if not found, indicating missing
  /// AppScope provider in the widget hierarchy.
  static AppScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope not found in context');
    return scope!;
  }

  @override
  bool updateShouldNotify(covariant AppScope oldWidget) => false;
}
