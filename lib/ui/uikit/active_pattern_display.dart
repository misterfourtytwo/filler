import 'package:flutter/material.dart';
import 'package:konstruktor/features/canvas/domain/canvas_pattern.dart';
import 'package:konstruktor/features/canvas/domain/custom_pattern.dart';
import 'package:konstruktor/features/canvas/domain/custom_pattern_painter.dart';
import 'package:konstruktor/ui/design_system.dart';

/// Widget to display the currently active pattern with rotation.
///
/// Shows a preview of the selected pattern with the current rotation angle
/// applied. Used to give users visual feedback about their current selection.
class ActivePatternDisplay extends StatelessWidget {
  /// Creates an active pattern display.
  const ActivePatternDisplay({
    super.key,
    required this.activePatternIndex,
    required this.rotationAngle,
    this.customPattern,
  });

  /// Index of the currently active pattern.
  final int activePatternIndex;

  /// Current rotation angle in radians.
  final double rotationAngle;

  /// Custom pattern if active (null if using built-in patterns).
  final CustomPattern? customPattern;

  @override
  Widget build(BuildContext context) {
    final isMobile = DesignSystem.isMobile(context);
    final scheme = Theme.of(context).colorScheme;

    // Get the pattern to display
    final pattern =
        customPattern ??
        CanvasPattern.values[activePatternIndex % CanvasPattern.values.length];

    return Container(
      padding: const EdgeInsets.all(DesignSystem.spaceSm),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
        border: Border.all(color: scheme.outline.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          // Pattern preview
          Container(
            width: isMobile ? 48 : 56,
            height: isMobile ? 48 : 56,
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
              border: Border.all(color: scheme.outline.withValues(alpha: 0.2)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
              child: Transform.rotate(
                angle: rotationAngle,
                child: CustomPaint(
                  painter: pattern is CustomPattern
                      ? CustomPatternPainter(
                          pattern,
                          paintColor: scheme.primary,
                        )
                      : PatternPainter(
                          pattern as CanvasPattern,
                          paintColor: scheme.primary,
                        ),
                ),
              ),
            ),
          ),

          const SizedBox(width: DesignSystem.spaceSm),

          // Pattern info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _getPatternName(pattern),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  '${(rotationAngle * 180 / 3.1416).round()}° rotation',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Gets the display name for the pattern.
  String _getPatternName(dynamic pattern) {
    if (pattern is CustomPattern) {
      return pattern.name;
    } else if (pattern is CanvasPattern) {
      switch (pattern) {
        case CanvasPattern.empty:
          return 'Empty';
        case CanvasPattern.solid:
          return 'Solid';
        case CanvasPattern.diagonal:
          return 'Diagonal';
        case CanvasPattern.checkerboard:
          return 'Checkerboard';
        case CanvasPattern.dots:
          return 'Dots';
        case CanvasPattern.cross:
          return 'Cross';
        case CanvasPattern.triangle:
          return 'Triangle';
        case CanvasPattern.circle:
          return 'Circle';
        case CanvasPattern.star:
          return 'Star';
        case CanvasPattern.wave:
          return 'Wave';
        case CanvasPattern.zigzag:
          return 'Zigzag';
        case CanvasPattern.quarterCircle:
          return 'Quarter Circle';
        case CanvasPattern.inverseQuarterCircle:
          return 'Inverse Quarter Circle';
      }
    }
    return 'Unknown';
  }
}
