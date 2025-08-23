import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';

/// Minimalist desktop-oriented action tile for primary navigation.
///
/// Renders a bold bordered tile with icon and title (and optional subtitle),
/// designed to feel custom and fashionably minimal without Material cards.
class ActionTile extends StatelessWidget {
  /// Creates an action tile.
  const ActionTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.onTap,
    this.width = 200,
    this.height = 150,
  });

  /// Primary title text.
  final String title;

  /// Optional subtitle text.
  final String? subtitle;

  /// Leading icon.
  final IconData icon;

  /// Tap callback.
  final VoidCallback onTap;

  /// Tile width.
  final double width;

  /// Tile height.
  final double height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        DesignSystem.radiusMd,
      ), // splash radius
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(DesignSystem.spaceLg),
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
          border: Border.all(width: DesignSystem.strokeThick),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: scheme.onSurface),
            const SizedBox(height: DesignSystem.spaceSm),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
                color: scheme.onSurface,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: DesignSystem.spaceXs),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
