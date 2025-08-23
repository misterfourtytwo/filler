import 'package:flutter/material.dart';
import 'custom_pattern.dart';

/// Custom painter that draws user-created patterns.
///
/// Renders a custom pattern by filling pixels based on the
/// boolean grid data from the CustomPattern model.
class CustomPatternPainter extends CustomPainter {
  /// Creates a custom pattern painter.
  const CustomPatternPainter(
    this.pattern, {
    this.rotation = 0.0,
    this.paintColor = Colors.black,
  });

  /// The custom pattern to draw.
  final CustomPattern pattern;

  /// Rotation angle in radians (0.0 = no rotation).
  final double rotation;

  /// The color to use for painting the pattern.
  final Color paintColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (pattern.isEmpty) {
      return; // Draw nothing for empty pattern
    }

    // Apply rotation if needed
    if (rotation != 0.0) {
      final center = Offset(size.width / 2, size.height / 2);
      canvas
        ..save()
        ..translate(center.dx, center.dy)
        ..rotate(rotation)
        ..translate(-center.dx, -center.dy);
    }

    final paint = Paint()
      ..color = paintColor
      ..style = PaintingStyle.fill;

    final gridSize = pattern.gridSize;
    final pixelSize = size.width / gridSize;

    // Draw each pixel in the grid
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (pattern.grid[row][col]) {
          final rect = Rect.fromLTWH(
            col * pixelSize,
            row * pixelSize,
            pixelSize,
            pixelSize,
          );
          canvas.drawRect(rect, paint);
        }
      }
    }

    // Restore canvas if rotation was applied
    if (rotation != 0.0) {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is CustomPatternPainter &&
        (oldDelegate.pattern.id != pattern.id ||
            oldDelegate.rotation != rotation ||
            oldDelegate.paintColor != paintColor);
  }
}
