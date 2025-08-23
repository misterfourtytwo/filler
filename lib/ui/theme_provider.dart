import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_provider.freezed.dart';

/// Theme mode options for the app.
enum AppThemeMode {
  /// Light theme.
  light,

  /// Dark theme.
  dark,

  /// System theme (follows device setting).
  system,
}

/// Extension to convert AppThemeMode to Flutter's ThemeMode.
extension AppThemeModeExtension on AppThemeMode {
  /// Converts to Flutter's ThemeMode.
  ThemeMode toThemeMode() {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  /// Converts from integer value.
  static AppThemeMode fromInt(int value) {
    switch (value) {
      case 0:
        return AppThemeMode.light;
      case 1:
        return AppThemeMode.dark;
      case 2:
        return AppThemeMode.system;
      default:
        return AppThemeMode.system;
    }
  }

  /// Converts to integer value.
  int toInt() {
    switch (this) {
      case AppThemeMode.light:
        return 0;
      case AppThemeMode.dark:
        return 1;
      case AppThemeMode.system:
        return 2;
    }
  }

  /// Gets the display name for the theme mode.
  String get displayName {
    switch (this) {
      case AppThemeMode.light:
        return 'Light';
      case AppThemeMode.dark:
        return 'Dark';
      case AppThemeMode.system:
        return 'System';
    }
  }

  /// Gets the icon for the theme mode.
  IconData get icon {
    switch (this) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.brightness_auto;
    }
  }
}

/// Events for theme management.
@freezed
class ThemeEvent with _$ThemeEvent {
  /// Changes the app theme mode.
  const factory ThemeEvent.changeTheme(AppThemeMode themeMode) = _ChangeTheme;
}

/// States for theme management.
@freezed
class ThemeState with _$ThemeState {
  /// Current theme state.
  const factory ThemeState({
    /// Current theme mode.
    required AppThemeMode themeMode,
  }) = _ThemeState;
}

/// BLoC for managing app theme.
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  /// Creates a theme BLoC with the given initial theme mode.
  ThemeBloc({AppThemeMode initialThemeMode = AppThemeMode.system})
    : super(ThemeState(themeMode: initialThemeMode)) {
    on<_ChangeTheme>((event, emit) {
      emit(state.copyWith(themeMode: event.themeMode));
    });
  }
}

/// Provider for theme BLoC.
class ThemeProvider extends StatelessWidget {
  /// Creates a theme provider.
  const ThemeProvider({
    super.key,
    required this.child,
    this.initialThemeMode = AppThemeMode.system,
  });

  /// The child widget.
  final Widget child;

  /// Initial theme mode.
  final AppThemeMode initialThemeMode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(initialThemeMode: initialThemeMode),
      child: child,
    );
  }
}
