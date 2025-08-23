import 'package:filler/ui/design_system.dart';
import 'package:flutter/material.dart';

/// A tile widget for color selection with a color picker dialog.
///
/// Displays a color swatch that can be tapped to open a color picker dialog.
/// Used for selecting pattern paint colors and canvas background colors.
class ColorPickerTile extends StatelessWidget {
  /// Creates a color picker tile with the given parameters.
  const ColorPickerTile({
    super.key,
    required this.label,
    required this.currentColor,
    required this.onColorChanged,
  });

  /// The label text to display next to the color swatch.
  final String label;

  /// The currently selected color.
  final Color currentColor;

  /// Callback called when a new color is selected.
  final ValueChanged<Color> onColorChanged;

  @override
  Widget build(BuildContext context) {
    final isMobile = DesignSystem.isMobile(context);
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: DesignSystem.getAdaptivePadding(context),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
        border: Border.all(color: scheme.outline.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: DesignSystem.spaceMd),
          GestureDetector(
            onTap: () async {
              final color = await showColorPicker(context, currentColor);
              if (color != null) {
                onColorChanged(color);
              }
            },
            child: Container(
              width: isMobile ? 48 : 56,
              height: isMobile ? 48 : 56,
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
                border: Border.all(
                  color: scheme.outline.withValues(alpha: 0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.color_lens,
                  color: currentColor.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                  size: isMobile ? 20 : 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows a color picker dialog and returns the selected color.
  ///
  /// [context] is the build context for showing the dialog.
  /// [initialColor] is the initially selected color.
  /// Returns the selected color or null if cancelled.
  Future<Color?> showColorPicker(
    BuildContext context,
    Color initialColor,
  ) async {
    Color? selectedColor;

    return showDialog<Color>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: initialColor,
            onColorChanged: (color) {
              selectedColor = color;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop(selectedColor ?? initialColor),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

/// Simple color picker widget for color selection.
class ColorPicker extends StatefulWidget {
  /// Creates a color picker with the given parameters.
  ///
  /// [pickerColor] is the initially selected color.
  /// [onColorChanged] is called when the user selects a different color.
  /// [pickerAreaHeightPercent] controls the height of the picker area (default: 0.8).
  const ColorPicker({
    super.key,
    required this.pickerColor,
    required this.onColorChanged,
    this.pickerAreaHeightPercent = 0.8,
  });

  /// The initially selected color.
  final Color pickerColor;

  /// Callback called when the user selects a different color.
  final ValueChanged<Color> onColorChanged;

  /// Controls the height of the picker area as a percentage (0.0 to 1.0).
  final double pickerAreaHeightPercent;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.pickerColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _predefinedColors.length,
              itemBuilder: (context, index) {
                final color = _predefinedColors[index];
                final isSelected = color.toARGB32() == _currentColor.toARGB32();

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentColor = color;
                    });
                    widget.onColorChanged(color);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(
                        DesignSystem.radiusSm,
                      ),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                        width: isSelected ? 3 : 1,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: DesignSystem.spaceMd),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: _currentColor,
              borderRadius: BorderRadius.circular(DesignSystem.radiusMd),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Center(
              child: Text(
                '#${_currentColor.toARGB32().toRadixString(16).toUpperCase().substring(2)}',
                style: TextStyle(
                  color: _currentColor.computeLuminance() > 0.5
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const List<Color> _predefinedColors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Color(0xFF8B4513), // Saddle Brown
    Color(0xFFD2691E), // Chocolate
    Color(0xFFCD853F), // Peru
    Color(0xFFDEB887), // Burlywood
    Color(0xFFF5DEB3), // Wheat
    Color(0xFFF4A460), // Sandy Brown
    Color(0xFFDAA520), // Goldenrod
    Color(0xFFBDB76B), // Dark Khaki
    Color(0xFF9ACD32), // Yellow Green
    Color(0xFF6B8E23), // Olive Drab
    Color(0xFF556B2F), // Dark Olive Green
    Color(0xFF228B22), // Forest Green
    Color(0xFF32CD32), // Lime Green
    Color(0xFF00CED1), // Dark Turquoise
    Color(0xFF40E0D0), // Turquoise
    Color(0xFF48D1CC), // Medium Turquoise
    Color(0xFF20B2AA), // Light Sea Green
    Color(0xFF5F9EA0), // Cadet Blue
    Color(0xFF4682B4), // Steel Blue
    Color(0xFFB0C4DE), // Light Steel Blue
    Color(0xFF87CEEB), // Sky Blue
    Color(0xFF87CEFA), // Light Sky Blue
    Color(0xFF191970), // Midnight Blue
    Color(0xFF483D8B), // Dark Slate Blue
    Color(0xFF6A5ACD), // Slate Blue
    Color(0xFF7B68EE), // Medium Slate Blue
    Color(0xFF9370DB), // Medium Purple
    Color(0xFF8A2BE2), // Blue Violet
    Color(0xFF9400D3), // Dark Violet
    Color(0xFF9932CC), // Dark Orchid
    Color(0xFFBA55D3), // Medium Orchid
    Color(0xFFDA70D6), // Orchid
    Color(0xFFEE82EE), // Violet
    Color(0xFFDDA0DD), // Plum
    Color(0xFFD8BFD8), // Thistle
    Color(0xFFE6E6FA), // Lavender
    Color(0xFFF0F8FF), // Alice Blue
    Color(0xFFF8F8FF), // Ghost White
    Color(0xFFF5F5F5), // White Smoke
    Color(0xFFF0F0F0), // Gainsboro
    Color(0xFFDCDCDC), // Light Gray
    Color(0xFFD3D3D3), // Light Steel Blue
    Color(0xFFC0C0C0), // Silver
    Color(0xFFA9A9A9), // Dark Gray
    Color(0xFF808080), // Gray
    Color(0xFF696969), // Dim Gray
    Color(0xFF2F4F4F), // Dark Slate Gray
    Color(0xFF708090), // Slate Gray
    Color(0xFF778899), // Light Slate Gray
  ];
}
