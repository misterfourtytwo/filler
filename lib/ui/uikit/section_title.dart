import 'package:flutter/material.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Section header widget for grouping related content.
///
/// Provides consistent typography and spacing for section titles
/// in forms and settings pages. Uses theme's titleMedium style
/// with standardized vertical padding.
class SectionTitle extends StatelessWidget {
  /// Creates a section title with the given text.
  const SectionTitle(this.text, {super.key});

  /// The title text to display.
  final String text;
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignSystem.spaceXs),
      child: Text(text, style: style),
    );
  }
}
