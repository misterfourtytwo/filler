import 'package:filler/features/canvas/domain/canvas_pattern.dart';
import 'package:filler/features/canvas/domain/custom_pattern.dart';
import 'package:filler/features/canvas/domain/custom_pattern_painter.dart';
import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Premium angle picker widget with sophisticated rotation controls.
///
/// Displays a premium interface for selecting pattern rotation angles
/// with visual feedback and polished interactions.
class AnglePicker extends StatefulWidget {
  /// Creates a premium angle picker with the given parameters.
  const AnglePicker({
    super.key,
    required this.currentAngle,
    required this.onAngleChanged,
    required this.activePatternIndex,
    this.customPattern,
  });

  /// Current rotation angle in radians.
  final double currentAngle;

  /// Callback when a new angle is selected.
  final ValueChanged<double> onAngleChanged;

  /// Index of the currently active pattern.
  final int activePatternIndex;

  /// Custom pattern if active (null if using built-in patterns).
  final CustomPattern? customPattern;

  @override
  State<AnglePicker> createState() => _AnglePickerState();
}

class _AnglePickerState extends State<AnglePicker> {
  /// Available rotation angles in radians.
  static const List<double> _angles = [
    0.0,
    1.5708,
    3.1416,
    4.7124,
  ]; // 0°, 90°, 180°, 270°

  /// Gets the index of the current angle.
  int get _currentIndex {
    final normalizedAngle = widget.currentAngle % (2 * 3.1416);
    for (int i = 0; i < _angles.length; i++) {
      if ((normalizedAngle - _angles[i]).abs() < 0.1) {
        return i;
      }
    }
    return 0; // Default to 0° if no match
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = DesignSystem.isMobile(context);
    final scheme = Theme.of(context).colorScheme;

    // Get the pattern to display
    final pattern =
        widget.customPattern ??
        CanvasPattern.values[widget.activePatternIndex %
            CanvasPattern.values.length];

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
          // Premium header
          _buildPremiumHeader(context),
          const SizedBox(height: DesignSystem.spaceLg),

          // Angle buttons with pattern previews
          _buildAngleButtons(context, pattern, isMobile),

          // Premium angle labels
          const SizedBox(height: DesignSystem.spaceMd),
          _buildAngleLabels(context),
        ],
      ),
    );
  }

  Widget _buildPremiumHeader(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(DesignSystem.spaceSm),
          decoration: BoxDecoration(
            color: scheme.primaryContainer,
            borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
          ),
          child: Icon(
            Icons.rotate_right,
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
                'Pattern Rotation',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
              ),
              Text(
                'Adjust the orientation of your pattern',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAngleButtons(
    BuildContext context,
    dynamic pattern,
    bool isMobile,
  ) {
    final buttonSize = isMobile ? 52.0 : 60.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_angles.length, (index) {
        final angle = _angles[index];
        final isSelected = index == _currentIndex;

        return _buildPremiumAngleButton(
          context,
          pattern,
          angle,
          isSelected,
          buttonSize,
          index,
        );
      }),
    );
  }

  Widget _buildPremiumAngleButton(
    BuildContext context,
    dynamic pattern,
    double angle,
    bool isSelected,
    double buttonSize,
    int index,
  ) {
    final scheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        widget.onAngleChanged(angle);
      },
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: isSelected ? scheme.primary : scheme.surface,
          borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
          border: Border.all(
            color: isSelected
                ? scheme.primary
                : scheme.outline.withValues(alpha: 0.2),
            width: isSelected
                ? DesignSystem.strokeMedium
                : DesignSystem.strokeThin,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: scheme.primary.withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : DesignSystem.shadowSubtle,
        ),
        child: Stack(
          children: [
            // Pattern preview
            ClipRRect(
              borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
              child: CustomPaint(
                painter: pattern is CustomPattern
                    ? CustomPatternPainter(
                        pattern,
                        rotation: angle,
                        paintColor: isSelected
                            ? scheme.onPrimary
                            : scheme.primary,
                      )
                    : PatternPainter(
                        pattern as CanvasPattern,
                        rotation: angle,
                        paintColor: isSelected
                            ? scheme.onPrimary
                            : scheme.primary,
                      ),
              ),
            ),
            // Selection indicator
            if (isSelected)
              Positioned(
                top: DesignSystem.spaceXs,
                right: DesignSystem.spaceXs,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: scheme.onPrimary,
                    shape: BoxShape.circle,
                    boxShadow: DesignSystem.shadowSubtle,
                  ),
                  child: Icon(Icons.check, size: 8, color: scheme.primary),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAngleLabels(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _angles.asMap().entries.map((entry) {
        final index = entry.key;
        final angle = entry.value;
        final isSelected = index == _currentIndex;

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceSm,
            vertical: DesignSystem.spaceXs,
          ),
          decoration: BoxDecoration(
            color: isSelected ? scheme.primaryContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
          ),
          child: Text(
            '${(angle * 180 / 3.1416).round()}°',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: isSelected
                  ? scheme.onPrimaryContainer
                  : scheme.onSurfaceVariant,
              letterSpacing: 0.5,
            ),
          ),
        );
      }).toList(),
    );
  }
}
