import 'package:filler/core/logging.dart';
import 'package:filler/features/prefs/presentation/preferences_bloc.dart';
import 'package:filler/ui/design_system.dart';
import 'package:filler/ui/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Ready state view with preference editing form fields.
///
/// Displays input fields for configuring default canvas settings.
/// Uses NumberFieldTile components for numeric inputs with
/// immediate BLoC event dispatch on value changes.
class PreferencesReadyView extends StatelessWidget {
  /// Creates a ready preferences view with current values.
  const PreferencesReadyView({
    super.key,
    required this.width,
    required this.height,
    required this.insets,
    required this.themeMode,
  });

  /// Current default canvas width value.
  final int width;

  /// Current default canvas height value.
  final int height;

  /// Current default canvas insets value.
  final int insets;

  /// Current theme mode value.
  final int themeMode;

  @override
  Widget build(BuildContext context) {
    final isDesktop = DesignSystem.isDesktop(context);

    AppLogger.navigation(
      'Preferences ready view built',
      data: {
        'layoutType': isDesktop ? 'desktop' : 'mobile',
        'currentValues': {
          'width': width,
          'height': height,
          'insets': insets,
          'themeMode': themeMode,
        },
      },
    );

    if (isDesktop) {
      // Desktop layout: Centered card with constrained width and scrolling
      return Center(
        child: Container(
          width: 600,
          height: double.infinity,
          padding: const EdgeInsets.all(DesignSystem.spaceLg),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Studio Preferences',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: DesignSystem.spaceXl),

                // Canvas settings
                CardSection(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionTitle('Default Canvas Dimensions'),
                      const SizedBox(height: DesignSystem.spaceSm),
                      IntegerPickerTile(
                        label: 'Width (pixels)',
                        value: width,
                        onChanged: (v) => context.read<PreferencesBloc>().add(
                          PreferencesEvent.setWidth(v),
                        ),
                      ),
                      IntegerPickerTile(
                        label: 'Height (pixels)',
                        value: height,
                        onChanged: (v) => context.read<PreferencesBloc>().add(
                          PreferencesEvent.setHeight(v),
                        ),
                      ),
                      IntegerPickerTile(
                        label: 'Spacing (pixels)',
                        value: insets,
                        minValue: 0,
                        onChanged: (v) => context.read<PreferencesBloc>().add(
                          PreferencesEvent.setInsets(v),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: DesignSystem.spaceLg),

                // Theme settings
                ThemeSwitchTile(
                  currentThemeMode: themeMode,
                  onThemeChanged: (v) => context.read<PreferencesBloc>().add(
                    PreferencesEvent.setThemeMode(v),
                  ),
                ),

                const SizedBox(height: DesignSystem.spaceXl),
                const Text(
                  'Changes are saved automatically when you tap the Save button.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // Mobile layout: Full width with padding
      return ListView(
        padding: const EdgeInsets.all(DesignSystem.spaceLg),
        children: [
          // Canvas settings
          CardSection(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle('Canvas Dimensions'),
                const SizedBox(height: DesignSystem.spaceSm),
                IntegerPickerTile(
                  label: 'Width',
                  value: width,
                  onChanged: (v) => context.read<PreferencesBloc>().add(
                    PreferencesEvent.setWidth(v),
                  ),
                ),
                IntegerPickerTile(
                  label: 'Height',
                  value: height,
                  onChanged: (v) => context.read<PreferencesBloc>().add(
                    PreferencesEvent.setHeight(v),
                  ),
                ),
                IntegerPickerTile(
                  label: 'Spacing',
                  value: insets,
                  minValue: 0,
                  onChanged: (v) => context.read<PreferencesBloc>().add(
                    PreferencesEvent.setInsets(v),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLg),

          // Theme settings
          ThemeSwitchTile(
            currentThemeMode: themeMode,
            onThemeChanged: (v) => context.read<PreferencesBloc>().add(
              PreferencesEvent.setThemeMode(v),
            ),
          ),
        ],
      );
    }
  }
}
