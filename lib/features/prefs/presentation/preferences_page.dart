import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konstruktor/core/logging.dart';
import 'package:konstruktor/features/prefs/presentation/preferences_bloc.dart';
import 'package:konstruktor/features/prefs/presentation/views/preferences_initial_view.dart';
import 'package:konstruktor/features/prefs/presentation/views/preferences_loading_view.dart';
import 'package:konstruktor/features/prefs/presentation/views/preferences_ready_view.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Preferences page for configuring default canvas settings.
///
/// Allows users to set default width, height, insets, and color
/// for new canvases. Changes are applied immediately but require
/// explicit save to persist to database.
class PreferencesPage extends StatelessWidget {
  /// Creates a preferences configuration page.
  const PreferencesPage({super.key});
  @override
  Widget build(BuildContext context) {
    AppLogger.navigation('Preferences page built');
    final bloc = context.read<PreferencesBloc>()
      ..add(const PreferencesEvent.load());

    final isDesktop = DesignSystem.isDesktop(context);

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              leading: const BackButton(),
              title: const Text('Studio Preferences'),
            ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PreferencesBloc, PreferencesState>(
              builder: (context, state) => state.map(
                initial: (_) => const PreferencesInitialView(),
                loading: (_) => const PreferencesLoadingView(),
                ready: (s) => PreferencesReadyView(
                  width: s.width,
                  height: s.height,
                  insets: s.insets,
                  themeMode: s.themeMode,
                ),
              ),
            ),
          ),
          // Save button at bottom
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AppLogger.interaction('Preferences save button pressed');
                  bloc.add(const PreferencesEvent.save());
                },
                style: ElevatedButton.styleFrom(),
                child: const Text(
                  'Save Preferences',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Number field moved to UI kit (NumberFieldTile)
