import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';

/// Empty state widget shown when content lists are empty.
///
/// Displays a centered message with optional icon to communicate
/// to users when there's no data to show. Used in gallery and
/// other list views when empty.
class EmptyState extends StatelessWidget {
  /// Creates an empty state with the given message and optional icon.
  const EmptyState({super.key, required this.message, this.icon});

  /// The message to display to the user.
  final String message;

  /// Optional icon to show above the message.
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        padding: const EdgeInsets.all(DesignSystem.spaceXl),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DesignSystem.radiusLg),
          border: Border.all(width: DesignSystem.strokeThick),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: DesignSystem.spaceXxl + DesignSystem.spaceLg,
                color: scheme.onSurface,
              ),
            const SizedBox(height: DesignSystem.spaceMd),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: scheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
