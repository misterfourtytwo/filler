import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';

/// List tile with integer picker for settings forms.
///
/// Combines a label and integer picker in a standardized
/// list tile format. Uses a slider with step buttons for
/// precise integer selection with a maximum value of 42.
class IntegerPickerTile extends StatelessWidget {
  /// Creates an integer picker tile with label and controls.
  const IntegerPickerTile({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.minValue = 1,
    this.maxValue = 42,
  });

  /// Label text displayed on the left side.
  final String label;

  /// Current integer value to display and edit.
  final int value;

  /// Callback when user changes the value.
  final void Function(int) onChanged;

  /// Minimum allowed value (default: 1).
  final int minValue;

  /// Maximum allowed value (default: 42).
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: DesignSystem.spaceSm,
        horizontal: DesignSystem.spaceMd,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
        border: Border.all(width: DesignSystem.strokeThick),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: scheme.onSurface,
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSm),
          Row(
            children: [
              // Decrease button
              IconButton(
                onPressed: value > minValue ? () => onChanged(value - 1) : null,
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(
                  backgroundColor: scheme.surfaceContainerHighest,
                  foregroundColor: scheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: DesignSystem.spaceMd),

              // Value display
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignSystem.spaceMd,
                    vertical: DesignSystem.spaceSm,
                  ),
                  decoration: BoxDecoration(
                    color: scheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
                  ),
                  child: Text(
                    value.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: scheme.onSurface,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: DesignSystem.spaceMd),

              // Increase button
              IconButton(
                onPressed: value < maxValue ? () => onChanged(value + 1) : null,
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor: scheme.surfaceContainerHighest,
                  foregroundColor: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignSystem.spaceSm),

          // Slider for quick selection
          Slider(
            value: value.toDouble(),
            min: minValue.toDouble(),
            max: maxValue.toDouble(),
            divisions: maxValue - minValue,
            onChanged: (newValue) => onChanged(newValue.round()),
            activeColor: scheme.primary,
            inactiveColor: scheme.outlineVariant,
          ),
        ],
      ),
    );
  }
}
