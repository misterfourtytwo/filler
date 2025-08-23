import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:filler/features/canvas/domain/canvas_pattern.dart';
import 'package:filler/features/canvas/domain/custom_pattern.dart';
import 'package:filler/features/canvas/domain/custom_pattern_painter.dart';
import 'package:filler/features/canvas/domain/pixel_data.dart';
import 'package:filler/ui/design_system.dart';

/// Premium grid widget that displays canvas pixels as interactive squares.
///
/// Renders a sophisticated grid of squares with visual feedback
/// and polished interactions. Each square represents
/// a pixel in the canvas that users can tap to paint with patterns.
class CanvasGrid extends StatefulWidget {
  /// Creates a premium canvas grid with the specified dimensions and data.
  const CanvasGrid({
    super.key,
    required this.width,
    required this.height,
    required this.insets,
    required this.pixels,
    required this.patternRotation,
    required this.customPattern,
    required this.onTap,
    this.onRotate,
    required this.boundaryKey,
    required this.patternPaintColor,
    required this.canvasBackgroundColor,
    this.showBorders = true,
  });

  /// Canvas width in pixels.
  final int width;

  /// Canvas height in pixels.
  final int height;

  /// Padding/insets around drawable area.
  final int insets;

  /// Pixel data with pattern indices and rotations.
  final List<PixelData> pixels;

  /// Pattern rotation angle in radians.
  final double patternRotation;

  /// Custom pattern if active (null if using built-in patterns).
  final CustomPattern? customPattern;

  /// Callback when a pixel is tapped, receives flat array index.
  final void Function(int) onTap;

  /// Callback when a pixel is rotated, receives flat array index.
  final void Function(int)? onRotate;

  /// Key for RepaintBoundary used in canvas export.
  final GlobalKey boundaryKey;

  /// Color to use for painting patterns.
  final Color patternPaintColor;

  /// Background color for the canvas.
  final Color canvasBackgroundColor;

  /// Whether to show borders around individual cells.
  final bool showBorders;

  @override
  State<CanvasGrid> createState() => _CanvasGridState();
}

class _CanvasGridState extends State<CanvasGrid> {
  void _handleTap(int index) {
    // Add premium haptic feedback
    HapticFeedback.lightImpact();

    // Call the original onTap callback
    widget.onTap(index);
  }

  void _handleRotate(int index) {
    if (widget.onRotate != null) {
      // Add premium haptic feedback
      HapticFeedback.mediumImpact();

      // Call the rotation callback
      widget.onRotate!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final pixelSize = isMobile
        ? DesignSystem.mobilePixelSize
        : DesignSystem.desktopPixelSize;
    final totalWidth = widget.width * pixelSize;
    final totalHeight = widget.height * pixelSize;

    // Calculate responsive sizing to prevent overflow
    final screenSize = MediaQuery.of(context).size;
    final maxWidth = screenSize.width * 0.9; // 90% of screen width
    final maxHeight = screenSize.height * 0.7; // 70% of screen height

    double scale = 1.0;
    if (totalWidth > maxWidth || totalHeight > maxHeight) {
      final scaleX = maxWidth / totalWidth;
      final scaleY = maxHeight / totalHeight;
      scale = scaleX < scaleY ? scaleX : scaleY;
    }

    final scaledWidth = totalWidth * scale;
    final scaledHeight = totalHeight * scale;

    return Container(
      width: scaledWidth,
      height: scaledHeight,
      decoration: BoxDecoration(
        color: widget.canvasBackgroundColor,
        borderRadius: BorderRadius.circular(DesignSystem.radiusXl),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(DesignSystem.radiusXl),
        child: RepaintBoundary(
          key: widget.boundaryKey,
          child: Container(
            color: widget.canvasBackgroundColor,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.width,
              ),
              itemCount: widget.pixels.length,
              itemBuilder: (context, index) {
                final pixelData = widget.pixels[index];
                final pattern = widget.customPattern != null
                    ? null
                    : CanvasPatternExtension.fromValue(pixelData.pattern);

                return _buildPremiumPixel(
                  context,
                  index,
                  pixelData,
                  pattern,
                  pixelSize,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumPixel(
    BuildContext context,
    int index,
    PixelData pixelData,
    CanvasPattern? pattern,
    double pixelSize,
  ) {
    return GestureDetector(
      onTap: () => _handleTap(index),
      onLongPress: () => _handleRotate(index),
      child: Container(
        width: pixelSize,
        height: pixelSize,
        decoration: widget.showBorders
            ? BoxDecoration(
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.08),
                  width: DesignSystem.strokeUltraThin,
                ),
              )
            : null,
        child: Stack(
          children: [
            // Pattern content with premium styling
            Container(
              width: pixelSize,
              height: pixelSize,
              decoration: BoxDecoration(
                color: widget.canvasBackgroundColor,
                borderRadius: widget.showBorders
                    ? BorderRadius.circular(DesignSystem.radiusXs)
                    : BorderRadius.zero,
              ),
              child: ClipRRect(
                borderRadius: widget.showBorders
                    ? BorderRadius.circular(DesignSystem.radiusXs)
                    : BorderRadius.zero,
                child: pattern != null
                    ? CustomPaint(
                        painter: PatternPainter(
                          pattern,
                          rotation: pixelData.rotation,
                          paintColor: widget.patternPaintColor,
                        ),
                      )
                    : widget.customPattern != null
                    ? CustomPaint(
                        painter: CustomPatternPainter(
                          widget.customPattern!,
                          rotation: widget.patternRotation,
                          paintColor: widget.patternPaintColor,
                        ),
                      )
                    : null,
              ),
            ),
            // Premium hover effect
            if (widget.showBorders)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusXs),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.05),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
