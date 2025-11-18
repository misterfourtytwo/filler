import 'package:flutter/material.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Circular color swatch button for color palette selection.
///
/// Displays a color as a circular avatar with tap interaction.
/// Shows a check mark when selected. Uses InkWell for ripple effect.
class ColorSwatchButton extends StatelessWidget {
  /// Creates a color swatch button with the given properties.
  const ColorSwatchButton({
    super.key,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  /// The color to display in the swatch.
  final Color color;

  /// Whether this swatch is currently selected.
  final bool selected;

  /// Callback when the swatch is tapped.
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(DesignSystem.spaceXl),
      child: Container(
        width: DesignSystem.spaceXl * 2,
        height: DesignSystem.spaceXl * 2,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(width: DesignSystem.strokeThick),
        ),
        child: selected ? const Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }
}
