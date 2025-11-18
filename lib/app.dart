import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konstruktor/core/logging.dart';
import 'package:konstruktor/data/database.dart';
import 'package:konstruktor/domain/repositories.dart';
import 'package:konstruktor/features/canvas/presentation/canvas_bloc.dart';
import 'package:konstruktor/features/gallery/presentation/gallery_bloc.dart';
import 'package:konstruktor/features/prefs/presentation/preferences_bloc.dart';
import 'package:konstruktor/ui/app_scope.dart';
import 'package:konstruktor/ui/design_system.dart';
import 'package:konstruktor/ui/navigation/app_navigation.dart';
import 'package:konstruktor/ui/theme_provider.dart';

/// Premium application widget that sets up the entire app architecture.
///
/// This widget initializes the database, repositories, BLoC providers,
/// and material app with sophisticated theming. It follows a clean architecture pattern
/// with dependency injection through AppScope and centralized state management.
class App extends StatefulWidget {
  /// Creates a new premium App widget.
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    AppLogger.instance.i('🏗️ Building premium App widget');

    // Use sleek Apple-inspired color schemes
    final lightColorScheme = DesignSystem.sleekLightColorScheme;
    final darkColorScheme = DesignSystem.sleekDarkColorScheme;

    AppLogger.instance.d('Using premium color schemes');

    AppLogger.database('Initializing database and repositories');
    final db = AppDatabase.instance;
    final canvasRepo = CanvasRepository(db);
    final prefsRepo = PreferencesRepository(db);

    AppLogger.instance.d('Dependencies created successfully');

    return AppScope(
      database: db,
      canvasRepository: canvasRepo,
      preferencesRepository: prefsRepo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PreferencesBloc(prefsRepo)),
          BlocProvider(
            create: (_) => CanvasBloc(prefs: prefsRepo, repo: canvasRepo),
          ),
          BlocProvider(create: (_) => GalleryBloc(canvasRepo)),
        ],
        child: BlocBuilder<PreferencesBloc, PreferencesState>(
          builder: (context, prefsState) {
            // Get theme mode from preferences, default to system
            AppThemeMode themeMode = AppThemeMode.system;

            prefsState.maybeWhen(
              ready: (width, height, insets, defaultPattern, themeModeValue) {
                switch (themeModeValue) {
                  case 0:
                    themeMode = AppThemeMode.light;
                    break;
                  case 1:
                    themeMode = AppThemeMode.dark;
                    break;
                  case 2:
                  default:
                    themeMode = AppThemeMode.system;
                    break;
                }
              },
              orElse: () {
                // Use system theme as default
                themeMode = AppThemeMode.system;
              },
            );

            return BlocProvider(
              create: (_) => ThemeBloc(initialThemeMode: themeMode),
              child: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  // Update preferences bloc with theme bloc reference
                  final prefsBloc = context.read<PreferencesBloc>();
                  final themeBloc = context.read<ThemeBloc>();
                  prefsBloc.themeBloc ??= themeBloc;

                  return MaterialApp(
                    title: 'Filler',
                    debugShowCheckedModeBanner:
                        false, // Remove debug banner for premium look
                    theme: DesignSystem.theme(lightColorScheme),
                    darkTheme: DesignSystem.theme(darkColorScheme),
                    themeMode: themeState.themeMode.toThemeMode(),
                    home: const AppNavigation(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
