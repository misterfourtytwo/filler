import 'package:filler/ui/design_system.dart';
import 'package:filler/ui/uikit/color_swatch_button.dart';
import 'package:flutter/material.dart';

/// Color palette widget for selecting painting colors.
///
/// Displays a grid of color swatches with one marked as active.
/// Uses design system colors by default but accepts custom palette.
/// Colors are converted to ARGB integers for consistency.
class ColorPalette extends StatelessWidget {
  /// Creates a color palette with selection handling.
  const ColorPalette({
    super.key,
    required this.active,
    required this.onSelect,
    this.colors,
  });

  /// Currently selected color as ARGB integer.
  final int active;

  /// Callback when a color is selected, receives ARGB integer.
  final void Function(int) onSelect;

  /// Optional custom color list, defaults to DesignSystem.palette.
  final List<Color>? colors;
  @override
  Widget build(BuildContext context) {
    final palette = (colors ?? DesignSystem.palette.values.toList())
        .map((c) => c.toARGB32())
        .toList();
    return Padding(
      padding: const EdgeInsets.all(DesignSystem.spaceLg),
      child: Wrap(
        spacing: DesignSystem.spaceMd,
        children: [
          for (final c in palette)
            ColorSwatchButton(
              color: Color(c),
              selected: c == active,
              onTap: () => onSelect(c),
            ),
        ],
      ),
    );
  }
}
