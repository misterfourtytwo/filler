import 'package:flutter/material.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Card-like surface container for grouping related content.
///
/// Provides consistent padding, surface color, and rounded corners
/// following the design system. Used primarily in settings and forms
/// to visually group related controls.
class CardSection extends StatelessWidget {
  /// Creates a card section with the given child content.
  const CardSection({super.key, required this.child});

  /// The content to display inside the card.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceLg),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
        border: Border.all(width: DesignSystem.strokeThick),
      ),
      child: child,
    );
  }
}
