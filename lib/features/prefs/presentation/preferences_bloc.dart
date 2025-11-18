import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:konstruktor/core/logging.dart';
import 'package:konstruktor/domain/repositories.dart';
import 'package:konstruktor/ui/theme_provider.dart';

part 'preferences_bloc.freezed.dart';

/// Events for preferences management operations.
///
/// Includes loading current preferences, updating individual
/// settings values, and saving changes to the database.
@freezed
sealed class PreferencesEvent with _$PreferencesEvent {
  /// Loads current preferences from repository.
  const factory PreferencesEvent.load() = _Load;

  /// Updates default canvas width.
  const factory PreferencesEvent.setWidth(int value) = _SetWidth;

  /// Updates default canvas height.
  const factory PreferencesEvent.setHeight(int value) = _SetHeight;

  /// Updates default canvas insets/padding.
  const factory PreferencesEvent.setInsets(int value) = _SetInsets;

  /// Updates default painting pattern.
  const factory PreferencesEvent.setPattern(int value) = _SetPattern;

  /// Updates theme mode preference.
  const factory PreferencesEvent.setThemeMode(int value) = _SetThemeMode;

  /// Saves current preferences to repository.
  const factory PreferencesEvent.save() = _Save;
}

/// States for preferences data loading and editing.
///
/// Follows standard initial → loading → ready pattern with
/// ready state containing current preference values.
@freezed
sealed class PreferencesState with _$PreferencesState {
  /// Initial state before preferences are loaded.
  const factory PreferencesState.initial() = _Initial;

  /// Loading state while fetching preferences.
  const factory PreferencesState.loading() = _Loading;

  /// Ready state with current preference values.
  const factory PreferencesState.ready({
    /// Default canvas width for new canvases.
    required int width,

    /// Default canvas height for new canvases.
    required int height,

    /// Default canvas insets/padding.
    required int insets,

    /// Default painting pattern as integer index.
    required int defaultPattern,

    /// Theme mode preference (0=light, 1=dark, 2=system).
    required int themeMode,
  }) = _Ready;
}

/// Business logic component for preferences management.
///
/// Handles loading, updating, and saving user preferences for
/// default canvas settings. Updates are applied immediately to
/// state but require explicit save to persist.
class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  /// Creates a preferences BLoC with the given repository.
  PreferencesBloc(this.repo, {this.themeBloc})
    : super(const PreferencesState.initial()) {
    AppLogger.bloc('Preferences', 'BLoC Created', null, 'initial');
    on<_Load>((event, emit) async {
      AppLogger.bloc('Preferences', 'Load Event', 'initial', 'loading');
      emit(const PreferencesState.loading());

      try {
        final stopwatch = Stopwatch()..start();
        final p = await repo.get();
        stopwatch.stop();

        AppLogger.preferences(
          'Loaded preferences from key-value store',
          data: {
            'width': p.width,
            'height': p.height,
            'insets': p.insets,
            'defaultPattern': p.defaultPattern.toString(),
            'themeMode': p.themeMode.toString(),
            'loadTime': '${stopwatch.elapsed.inMilliseconds}ms',
          },
        );

        emit(
          PreferencesState.ready(
            width: p.width,
            height: p.height,
            insets: p.insets,
            defaultPattern: p.defaultPattern,
            themeMode: p.themeMode,
          ),
        );

        AppLogger.bloc('Preferences', 'Load Complete', 'loading', 'ready');
      } on Exception catch (e, stackTrace) {
        AppLogger.error(
          'Failed to load preferences',
          error: e,
          stackTrace: stackTrace,
        );
      }
    });
    on<_SetWidth>((e, emit) {
      AppLogger.preferences(
        'Width change requested',
        data: {
          'newValue': e.value,
          'currentState': state.runtimeType.toString(),
        },
      );

      state.maybeWhen(
        ready: (w, h, i, p, t) {
          AppLogger.preferences(
            'Updating width',
            data: {'from': w, 'to': e.value},
          );

          emit(
            PreferencesState.ready(
              width: e.value,
              height: h,
              insets: i,
              defaultPattern: p,
              themeMode: t,
            ),
          );

          AppLogger.bloc('Preferences', 'SetWidth', 'ready', 'ready');
        },
        orElse: () {
          AppLogger.warning('SetWidth called but preferences not ready');
        },
      );
    });
    on<_SetHeight>((e, emit) {
      state.maybeWhen(
        ready: (w, h, i, p, t) {
          emit(
            PreferencesState.ready(
              width: w,
              height: e.value,
              insets: i,
              defaultPattern: p,
              themeMode: t,
            ),
          );
        },
        orElse: () {},
      );
    });
    on<_SetInsets>((e, emit) {
      state.maybeWhen(
        ready: (w, h, i, p, t) {
          emit(
            PreferencesState.ready(
              width: w,
              height: h,
              insets: e.value,
              defaultPattern: p,
              themeMode: t,
            ),
          );
        },
        orElse: () {},
      );
    });
    on<_SetPattern>((e, emit) {
      state.maybeWhen(
        ready: (w, h, i, p, t) {
          emit(
            PreferencesState.ready(
              width: w,
              height: h,
              insets: i,
              defaultPattern: e.value,
              themeMode: t,
            ),
          );
        },
        orElse: () {},
      );
    });
    on<_SetThemeMode>((e, emit) {
      state.maybeWhen(
        ready: (w, h, i, p, t) {
          AppLogger.preferences(
            'Theme mode change requested',
            data: {'newValue': e.value, 'currentValue': t},
          );

          emit(
            PreferencesState.ready(
              width: w,
              height: h,
              insets: i,
              defaultPattern: p,
              themeMode: e.value,
            ),
          );

          // Update theme bloc if available
          AppThemeMode newThemeMode;
          switch (e.value) {
            case 0:
              newThemeMode = AppThemeMode.light;
              break;
            case 1:
              newThemeMode = AppThemeMode.dark;
              break;
            case 2:
            default:
              newThemeMode = AppThemeMode.system;
              break;
          }
          themeBloc?.add(ThemeEvent.changeTheme(newThemeMode));

          AppLogger.bloc('Preferences', 'SetThemeMode', 'ready', 'ready');
        },
        orElse: () {
          AppLogger.warning('SetThemeMode called but preferences not ready');
        },
      );
    });
    on<_Save>((event, emit) async {
      AppLogger.preferences('Save requested');

      await state.maybeWhen(
        ready: (w, h, i, c, t) async {
          try {
            final stopwatch = Stopwatch()..start();

            AppLogger.preferences(
              'Saving preferences to database',
              data: {
                'width': w,
                'height': h,
                'insets': i,
                'defaultPattern': c,
                'themeMode': t,
              },
            );

            await repo.save(
              width: w,
              height: h,
              insets: i,
              defaultPattern: c,
              themeMode: t,
            );

            stopwatch.stop();
            AppLogger.performance('Preferences save', stopwatch.elapsed);
            AppLogger.preferences(
              'Preferences saved successfully',
              data: {
                'width': w,
                'height': h,
                'insets': i,
                'defaultPattern': c,
                'themeMode': t,
              },
            );
          } on Exception catch (e, stackTrace) {
            AppLogger.error(
              'Failed to save preferences',
              error: e,
              stackTrace: stackTrace,
              data: {
                'width': w,
                'height': h,
                'insets': i,
                'defaultPattern': c,
                'themeMode': t,
              },
            );
          }
        },
        orElse: () {
          AppLogger.warning('Save called but preferences not ready');
        },
      );
    });
  }

  /// Repository for preferences persistence.
  final PreferencesRepository repo;

  /// Optional theme bloc for updating theme mode.
  ThemeBloc? themeBloc;
}
