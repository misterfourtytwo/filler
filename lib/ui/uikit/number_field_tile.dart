import 'package:flutter/material.dart';
import 'package:konstruktor/ui/design_system.dart';

/// List tile with numeric input field for settings forms.
///
/// Combines a label and numeric text field in a standardized
/// list tile format. Validates input and calls onChanged with
/// the parsed integer value as user types, and onSubmitted when
/// user finishes editing.
class NumberFieldTile extends StatelessWidget {
  /// Creates a number field tile with label and input.
  const NumberFieldTile({
    super.key,
    required this.label,
    required this.value,
    this.onChanged,
    this.onSubmitted,
  });

  /// Label text displayed on the left side.
  final String label;

  /// Current numeric value to display and edit.
  final int value;

  /// Callback when user changes the value (real-time updates).
  final void Function(int)? onChanged;

  /// Callback when user submits a new value (Enter or focus loss).
  final void Function(int)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value.toString());
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
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: scheme.onSurface,
              ),
            ),
          ),
          SizedBox(
            width: DesignSystem.spaceXxl * 3,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: onChanged != null
                  ? (text) {
                      final parsedValue = int.tryParse(text);
                      if (parsedValue != null) {
                        onChanged!(parsedValue);
                      }
                    }
                  : null,
              onSubmitted: onSubmitted != null
                  ? (text) => onSubmitted!(int.tryParse(text) ?? value)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
