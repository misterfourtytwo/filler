import 'package:filler/ui/design_system.dart';
import 'package:filler/ui/theme_provider.dart';
import 'package:flutter/material.dart';

/// Premium theme switch tile for selecting app theme mode.
///
/// Displays a sophisticated theme selector with icons and descriptions
/// for light, dark, and system theme options.
class ThemeSwitchTile extends StatelessWidget {
  /// Creates a premium theme switch tile.
  const ThemeSwitchTile({
    super.key,
    required this.currentThemeMode,
    required this.onThemeChanged,
  });

  /// Current theme mode value (0=light, 1=dark, 2=system).
  final int currentThemeMode;

  /// Callback when theme mode is changed.
  final ValueChanged<int> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    AppThemeMode currentMode;
    switch (currentThemeMode) {
      case 0:
        currentMode = AppThemeMode.light;
        break;
      case 1:
        currentMode = AppThemeMode.dark;
        break;
      case 2:
      default:
        currentMode = AppThemeMode.system;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceLg),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(DesignSystem.radiusLg),
        border: Border.all(color: scheme.outline.withValues(alpha: 0.1)),
        boxShadow: DesignSystem.shadowSubtle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spaceSm),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer,
                  borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
                ),
                child: Icon(
                  Icons.palette,
                  size: 18,
                  color: scheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: DesignSystem.spaceMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Theme',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: scheme.onSurface,
                      ),
                    ),
                    Text(
                      'Choose your preferred appearance',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceLg),

          // Theme options
          _buildThemeOptions(context, currentMode),
        ],
      ),
    );
  }

  Widget _buildThemeOptions(BuildContext context, AppThemeMode currentMode) {
    final scheme = Theme.of(context).colorScheme;
    final options = AppThemeMode.values;

    return Column(
      children: options.map((themeMode) {
        final isSelected = themeMode == currentMode;

        return Container(
          margin: const EdgeInsets.only(bottom: DesignSystem.spaceSm),
          decoration: BoxDecoration(
            color: isSelected ? scheme.primaryContainer : scheme.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
            border: Border.all(
              color: isSelected
                  ? scheme.primary
                  : scheme.outline.withValues(alpha: 0.2),
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: scheme.primary.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onThemeChanged(themeMode.toInt()),
              borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
              child: Padding(
                padding: const EdgeInsets.all(DesignSystem.spaceMd),
                child: Row(
                  children: [
                    // Theme icon
                    Container(
                      padding: const EdgeInsets.all(DesignSystem.spaceSm),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? scheme.primary
                            : scheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(
                          DesignSystem.radiusSm,
                        ),
                      ),
                      child: Icon(
                        themeMode.icon,
                        size: 20,
                        color: isSelected
                            ? scheme.onPrimary
                            : scheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: DesignSystem.spaceMd),

                    // Theme info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            themeMode.displayName,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? scheme.onPrimaryContainer
                                      : scheme.onSurface,
                                ),
                          ),
                          Text(
                            _getThemeDescription(themeMode),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: isSelected
                                      ? scheme.onPrimaryContainer.withValues(
                                          alpha: 0.8,
                                        )
                                      : scheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ),

                    // Selection indicator
                    if (isSelected)
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: scheme.primary,
                          shape: BoxShape.circle,
                          boxShadow: DesignSystem.shadowSubtle,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 12,
                          color: scheme.onPrimary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _getThemeDescription(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.light:
        return 'Clean, bright interface for daytime use';
      case AppThemeMode.dark:
        return 'Easy on the eyes for low-light environments';
      case AppThemeMode.system:
        return 'Automatically matches your device setting';
    }
  }
}
