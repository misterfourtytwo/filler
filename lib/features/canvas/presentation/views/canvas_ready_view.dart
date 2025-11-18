import 'package:filler/features/canvas/domain/canvas_pattern.dart';
import 'package:filler/features/canvas/domain/custom_pattern.dart';
import 'package:filler/features/canvas/domain/custom_pattern_painter.dart';
import 'package:filler/features/canvas/domain/pixel_data.dart';
import 'package:filler/features/canvas/presentation/canvas_bloc.dart';
import 'package:filler/features/canvas/presentation/widgets/canvas_grid.dart';
import 'package:filler/features/canvas/presentation/widgets/custom_pattern_editor.dart';
import 'package:filler/ui/design_system.dart';
import 'package:filler/ui/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Ready state view with interactive canvas grid and color palette.
///
/// Displays the fully loaded canvas with a grid for pixel painting
/// and color selection palette. Handles user interactions by
/// dispatching BLoC events for painting and color changes.
class CanvasReadyView extends StatelessWidget {
  /// Creates a ready canvas view with all required canvas data.
  const CanvasReadyView({
    super.key,
    required this.width,
    required this.height,
    required this.insets,
    required this.activePatternId,
    required this.patternRotation,
    required this.customPattern,
    required this.pixels,
    required this.boundaryKey,
    required this.patternPaintColor,
    required this.canvasBackgroundColor,
  });

  /// Canvas width in pixels.
  final int width;

  /// Canvas height in pixels.
  final int height;

  /// Padding/insets around the canvas.
  final int insets;

  /// Currently selected color as ARGB integer.
  final int activePatternId;

  /// Pattern rotation angle in radians.
  final double patternRotation;

  /// Custom pattern if active (null if using built-in patterns).
  final CustomPattern? customPattern;

  /// Pixel data with pattern indices and rotations in row-major order.
  final List<PixelData> pixels;

  /// Global key for RepaintBoundary used in export.
  final GlobalKey boundaryKey;

  /// Color to use for painting patterns.
  final Color patternPaintColor;

  /// Background color for the canvas.
  final Color canvasBackgroundColor;

  void _showCustomPatternEditor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CustomPatternEditor(
        onSave: (pattern) {
          context.read<CanvasBloc>().add(CanvasEvent.setCustomPattern(pattern));
          Navigator.of(context).pop();
        },
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

    if (isDesktop) {
      // Desktop layout: Side-by-side canvas and toolbox
      return Row(
        children: [
          Expanded(flex: 3, child: _buildCanvasArea(context)),
          Container(
            width: 1,
            color: Theme.of(context).dividerColor,
            margin: const EdgeInsets.symmetric(
              horizontal: DesignSystem.spaceLg,
            ),
          ),
          Expanded(child: _buildToolbox(context)),
        ],
      );
    } else {
      // Mobile/tablet layout: Canvas with bottom toolbox
      return Column(
        children: [
          Expanded(child: _buildCanvasArea(context)),
          _buildMobileToolbox(context),
        ],
      );
    }
  }

  /// Builds the canvas area with proper centering and scrolling
  Widget _buildCanvasArea(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(DesignSystem.spaceLg),
        child: CanvasGrid(
          width: width,
          height: height,
          insets: insets,
          pixels: pixels,
          patternRotation: patternRotation,
          customPattern: customPattern,
          onTap: (i) => context.read<CanvasBloc>().add(CanvasEvent.paint(i)),
          onRotate: (i) =>
              context.read<CanvasBloc>().add(CanvasEvent.rotatePixel(i)),
          boundaryKey: boundaryKey,
          patternPaintColor: patternPaintColor,
          canvasBackgroundColor: canvasBackgroundColor,
        ),
      ),
    );
  }

  /// Builds the desktop toolbox with all tools.
  Widget _buildToolbox(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(DesignSystem.spaceLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Active pattern display
          ActivePatternDisplay(
            activePatternIndex: activePatternId,
            rotationAngle: patternRotation,
            customPattern: customPattern,
          ),
          const SizedBox(height: DesignSystem.spaceLg),

          // Pattern palette
          const SectionTitle('Patterns'),
          const SizedBox(height: DesignSystem.spaceSm),
          PatternPalette(
            patterns: CanvasPattern.values,
            selectedPattern: CanvasPattern.values[activePatternId],
            onPatternSelected: (pattern) => context.read<CanvasBloc>().add(
              CanvasEvent.setActivePatternId(pattern.value),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLg),

          // Angle picker
          AnglePicker(
            currentAngle: patternRotation,
            onAngleChanged: (angle) => context.read<CanvasBloc>().add(
              CanvasEvent.rotatePattern(angle),
            ),
            activePatternIndex: activePatternId,
            customPattern: customPattern,
          ),
          const SizedBox(height: DesignSystem.spaceLg),

          // Fill button
          ElevatedButton.icon(
            onPressed: () =>
                context.read<CanvasBloc>().add(const CanvasEvent.fill()),
            icon: const Icon(Icons.format_color_fill),
            label: const Text('Fill Empty'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLg),

          // Custom pattern button
          ElevatedButton.icon(
            onPressed: () => _showCustomPatternEditor(context),
            icon: const Icon(Icons.edit),
            label: const Text('Custom Pattern'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceLg),

          // Color pickers
          const SectionTitle('Canvas Colors'),
          const SizedBox(height: DesignSystem.spaceSm),
          ColorPickerTile(
            label: 'Pattern Paint Color',
            currentColor: patternPaintColor,
            onColorChanged: (color) => context.read<CanvasBloc>().add(
              CanvasEvent.setPatternPaintColor(color),
            ),
          ),
          const SizedBox(height: DesignSystem.spaceSm),
          ColorPickerTile(
            label: 'Canvas Background Color',
            currentColor: canvasBackgroundColor,
            onColorChanged: (color) => context.read<CanvasBloc>().add(
              CanvasEvent.setCanvasBackgroundColor(color),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the minimalist mobile toolbox at the bottom.
  Widget _buildMobileToolbox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSystem.spaceMd,
            vertical: DesignSystem.spaceSm,
          ),
          child: Column(
            children: [
              // Simplified active pattern with rotation controls
              _buildCompactPatternSelector(context),
              const SizedBox(height: DesignSystem.spaceSm),

              // Pattern palette
              PatternPalette(
                patterns: CanvasPattern.values,
                selectedPattern: CanvasPattern.values[activePatternId],
                onPatternSelected: (pattern) => context.read<CanvasBloc>().add(
                  CanvasEvent.setActivePatternId(pattern.index),
                ),
              ),
              const SizedBox(height: DesignSystem.spaceSm),

              // Angle picker
              AnglePicker(
                currentAngle: patternRotation,
                onAngleChanged: (angle) {
                  if (angle == patternRotation) return;
                  context.read<CanvasBloc>().add(
                    CanvasEvent.rotatePattern(angle),
                  );
                },
                activePatternIndex: activePatternId,
                customPattern: customPattern,
              ),
              const SizedBox(height: DesignSystem.spaceSm),

              // Compact controls row
              _buildCompactControlsRow(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a compact pattern selector with rotation indicator.
  Widget _buildCompactPatternSelector(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final pattern =
        customPattern ??
        CanvasPattern.values[activePatternId % CanvasPattern.values.length];

    return Row(
      children: [
        // Pattern preview
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
            border: Border.all(color: scheme.outline.withValues(alpha: 0.3)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
            child: Transform.rotate(
              angle: patternRotation,
              child: CustomPaint(
                painter: pattern is CustomPattern
                    ? CustomPatternPainter(pattern, paintColor: scheme.primary)
                    : PatternPainter(
                        pattern as CanvasPattern,
                        paintColor: scheme.primary,
                      ),
              ),
            ),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceSm),

        // Pattern name and rotation
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getPatternName(pattern),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                '${(patternRotation * 180 / 3.1416).round()}° rotation',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a compact row with custom pattern and color controls.
  Widget _buildCompactControlsRow(BuildContext context) {
    return Row(
      children: [
        // Fill button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () =>
                context.read<CanvasBloc>().add(const CanvasEvent.fill()),
            icon: const Icon(Icons.format_color_fill, size: 16),
            label: const Text('Fill'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSystem.spaceSm,
                vertical: DesignSystem.spaceXs,
              ),
            ),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceSm),

        // Custom pattern button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showCustomPatternEditor(context),
            icon: const Icon(Icons.edit, size: 16),
            label: const Text('Custom'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSystem.spaceSm,
                vertical: DesignSystem.spaceXs,
              ),
            ),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceSm),

        // Color picker buttons
        _buildCompactColorPicker(
          context,
          'Paint',
          patternPaintColor,
          (color) => context.read<CanvasBloc>().add(
            CanvasEvent.setPatternPaintColor(color),
          ),
        ),
        const SizedBox(width: DesignSystem.spaceXs),

        _buildCompactColorPicker(
          context,
          'Background',
          canvasBackgroundColor,
          (color) => context.read<CanvasBloc>().add(
            CanvasEvent.setCanvasBackgroundColor(color),
          ),
        ),
      ],
    );
  }

  /// Builds a compact color picker button.
  Widget _buildCompactColorPicker(
    BuildContext context,
    String label,
    Color currentColor,
    ValueChanged<Color> onColorChanged,
  ) {
    return GestureDetector(
      onTap: () => _showColorPicker(context, currentColor, onColorChanged),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: currentColor,
          borderRadius: BorderRadius.circular(DesignSystem.radiusSm),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Icon(
          Icons.palette,
          size: 16,
          color: currentColor.computeLuminance() > 0.5
              ? Colors.black54
              : Colors.white70,
        ),
      ),
    );
  }

  /// Shows a color picker dialog.
  Future<void> _showColorPicker(
    BuildContext context,
    Color currentColor,
    ValueChanged<Color> onColorChanged,
  ) async {
    // Import the color picker package first
    // For now, show a simple dialog with predefined colors
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.cyan,
      Colors.pink,
      Colors.black,
      Colors.white,
    ];

    await showDialog<Color>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Color'),
        content: Wrap(
          spacing: DesignSystem.spaceXs,
          runSpacing: DesignSystem.spaceXs,
          children: colors
              .map(
                (color) => GestureDetector(
                  onTap: () {
                    onColorChanged(color);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(
                        DesignSystem.radiusSm,
                      ),
                      border: Border.all(
                        color: currentColor == color
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(
                                context,
                              ).colorScheme.outline.withValues(alpha: 0.3),
                        width: currentColor == color ? 2 : 1,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
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
