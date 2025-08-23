import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:filler/features/canvas/domain/canvas_pattern.dart';
import 'package:filler/ui/design_system.dart';

/// Interactive button for selecting canvas patterns.
///
/// Displays a pattern preview and handles selection state.
/// Used in pattern palette for canvas painting.
class PatternSwatchButton extends StatefulWidget {
  /// Creates a pattern swatch button.
  const PatternSwatchButton({
    super.key,
    required this.pattern,
    required this.selected,
    required this.onTap,
  });

  /// The pattern to display.
  final CanvasPattern pattern;

  /// Whether this pattern is currently selected.
  final bool selected;

  /// Callback when the button is tapped.
  final VoidCallback onTap;

  @override
  State<PatternSwatchButton> createState() => _PatternSwatchButtonState();
}

class _PatternSwatchButtonState extends State<PatternSwatchButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = widget.selected;

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: () {
        HapticFeedback.lightImpact();
        widget.onTap();
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: theme.colorScheme.shadow.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: CustomPaint(
            size: const Size(24, 24),
            painter: PatternPainter(
              widget.pattern,
              rotation: 0.0,
              paintColor: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
