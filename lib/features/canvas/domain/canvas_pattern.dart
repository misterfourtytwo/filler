import 'dart:math';
import 'package:flutter/material.dart';

/// Enum representing different patterns that can be drawn in canvas squares.
///
/// Each pattern has a unique visual representation drawn by a custom painter.
/// This replaces the arbitrary color system with meaningful pattern-based painting.
enum CanvasPattern {
  /// Empty/transparent pattern
  empty,

  /// Solid filled pattern
  solid,

  /// Diagonal stripes pattern
  diagonal,

  /// Checkerboard pattern
  checkerboard,

  /// Dots pattern
  dots,

  /// Cross pattern
  cross,

  /// Triangle pattern
  triangle,

  /// Circle pattern
  circle,

  /// Star pattern
  star,

  /// Wave pattern
  wave,

  /// Zigzag pattern
  zigzag,

  /// Quarter circle pattern (top-left)
  quarterCircle,

  /// Inverse quarter circle pattern (bottom-right)
  inverseQuarterCircle,
}

/// Extension to provide color mapping for each pattern.
extension CanvasPatternExtension on CanvasPattern {
  /// Returns the color associated with this pattern.
  Color get color {
    switch (this) {
      case CanvasPattern.empty:
        return Colors.transparent;
      case CanvasPattern.solid:
        return Colors.black;
      case CanvasPattern.diagonal:
        return Colors.black;
      case CanvasPattern.checkerboard:
        return Colors.black;
      case CanvasPattern.dots:
        return Colors.black;
      case CanvasPattern.cross:
        return Colors.black;
      case CanvasPattern.triangle:
        return Colors.black;
      case CanvasPattern.circle:
        return Colors.black;
      case CanvasPattern.star:
        return Colors.black;
      case CanvasPattern.wave:
        return Colors.black;
      case CanvasPattern.zigzag:
        return Colors.black;
      case CanvasPattern.quarterCircle:
        return Colors.black;
      case CanvasPattern.inverseQuarterCircle:
        return Colors.black;
    }
  }

  /// Returns the color for this pattern using the provided paint color.
  Color getColorWithPaintColor(Color paintColor) {
    switch (this) {
      case CanvasPattern.empty:
        return Colors.transparent;
      case CanvasPattern.solid:
        return paintColor;
      case CanvasPattern.diagonal:
        return paintColor;
      case CanvasPattern.checkerboard:
        return paintColor;
      case CanvasPattern.dots:
        return paintColor;
      case CanvasPattern.cross:
        return paintColor;
      case CanvasPattern.triangle:
        return paintColor;
      case CanvasPattern.circle:
        return paintColor;
      case CanvasPattern.star:
        return paintColor;
      case CanvasPattern.wave:
        return paintColor;
      case CanvasPattern.zigzag:
        return paintColor;
      case CanvasPattern.quarterCircle:
        return paintColor;
      case CanvasPattern.inverseQuarterCircle:
        return paintColor;
    }
  }

  /// Returns the integer value for this pattern (for storage).
  int get value {
    return index;
  }

  /// Creates a pattern from an integer value.
  static CanvasPattern fromValue(int value) {
    if (value < 0 || value >= CanvasPattern.values.length) {
      return CanvasPattern.empty;
    }
    return CanvasPattern.values[value];
  }
}

/// Custom painter that draws patterns in canvas squares.
///
/// Each pattern has a unique visual representation drawn using
/// Canvas drawing operations instead of solid color fills.
class PatternPainter extends CustomPainter {
  /// Creates a pattern painter for the given pattern.
  const PatternPainter(
    this.pattern, {
    this.rotation = 0.0,
    this.paintColor = Colors.black,
  });

  /// The pattern to draw.
  final CanvasPattern pattern;

  /// Rotation angle in radians (0.0 = no rotation).
  final double rotation;

  /// The color to use for painting the pattern.
  final Color paintColor;

  @override
  void paint(Canvas canvas, Size size) {
    // Define the drawing bounds to ensure patterns stay within the cell
    final bounds = Rect.fromLTWH(0, 0, size.width, size.height);

    if (pattern == CanvasPattern.empty) {
      // Draw a subtle X or eraser icon for empty pattern
      final paint = Paint()
        ..color = Colors.grey.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      final path = Path()
        ..moveTo(size.width * 0.2, size.height * 0.2)
        ..lineTo(size.width * 0.8, size.height * 0.8)
        ..moveTo(size.width * 0.8, size.height * 0.2)
        ..lineTo(size.width * 0.2, size.height * 0.8);

      canvas.drawPath(path, paint);
      return;
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
      ..color = pattern.getColorWithPaintColor(paintColor)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = pattern.getColorWithPaintColor(paintColor)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05; // Scale stroke width with square size

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    switch (pattern) {
      case CanvasPattern.solid:
        canvas.drawRect(bounds, paint);
        break;

      case CanvasPattern.diagonal:
        _drawDiagonalStripes(canvas, bounds, paint);
        break;

      case CanvasPattern.checkerboard:
        _drawCheckerboard(canvas, bounds, paint);
        break;

      case CanvasPattern.dots:
        _drawDots(canvas, bounds, paint);
        break;

      case CanvasPattern.cross:
        _drawCross(canvas, bounds, strokePaint);
        break;

      case CanvasPattern.triangle:
        _drawTriangle(canvas, bounds, paint);
        break;

      case CanvasPattern.circle:
        canvas.drawCircle(center, radius, paint);
        break;

      case CanvasPattern.star:
        _drawStar(canvas, bounds, paint);
        break;

      case CanvasPattern.wave:
        _drawWave(canvas, bounds, strokePaint);
        break;

      case CanvasPattern.zigzag:
        _drawZigzag(canvas, bounds, strokePaint);
        break;

      case CanvasPattern.quarterCircle:
        _drawQuarterCircle(canvas, bounds, paint);
        break;

      case CanvasPattern.inverseQuarterCircle:
        _drawInverseQuarterCircle(canvas, bounds, paint);
        break;

      case CanvasPattern.empty:
        break; // Already handled above
    }

    // Restore canvas if rotation was applied
    if (rotation != 0.0) {
      canvas.restore();
    }
  }

  void _drawDiagonalStripes(Canvas canvas, Rect bounds, Paint paint) {
    final stripeWidth = bounds.width * 0.1; // Scale with square size
    final path = Path();

    for (double x = -bounds.width; x < bounds.width * 2; x += stripeWidth * 2) {
      final rect = Rect.fromLTWH(x, 0, stripeWidth, bounds.height);
      final clippedRect = rect.intersect(bounds);
      if (!clippedRect.isEmpty) {
        path
          ..moveTo(clippedRect.left, clippedRect.top)
          ..lineTo(clippedRect.right, clippedRect.top)
          ..lineTo(clippedRect.right, clippedRect.bottom)
          ..lineTo(clippedRect.left, clippedRect.bottom)
          ..close();
      }
    }

    canvas.drawPath(path, paint);
  }

  void _drawCheckerboard(Canvas canvas, Rect bounds, Paint paint) {
    final squareSize = bounds.width * 0.2; // Scale with square size
    final cols = (bounds.width / squareSize).ceil();
    final rows = (bounds.height / squareSize).ceil();

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        if ((row + col) % 2 == 0) {
          final rect = Rect.fromLTWH(
            bounds.left + col * squareSize,
            bounds.top + row * squareSize,
            squareSize,
            squareSize,
          );
          final clippedRect = rect.intersect(bounds);
          if (!clippedRect.isEmpty) {
            canvas.drawRect(clippedRect, paint);
          }
        }
      }
    }
  }

  void _drawDots(Canvas canvas, Rect bounds, Paint paint) {
    final dotRadius = bounds.width * 0.08; // Scale with square size
    final spacing = bounds.width * 0.3; // Scale with square size

    for (double x = bounds.left + spacing; x < bounds.right; x += spacing) {
      for (double y = bounds.top + spacing; y < bounds.bottom; y += spacing) {
        final center = Offset(x, y);
        if (bounds.contains(center)) {
          canvas.drawCircle(center, dotRadius, paint);
        }
      }
    }
  }

  void _drawCross(Canvas canvas, Rect bounds, Paint paint) {
    final center = Offset(bounds.center.dx, bounds.center.dy);
    final armLength = bounds.width / 3;
    final armWidth = bounds.width * 0.1; // Scale with square size

    // Vertical arm
    final verticalRect = Rect.fromCenter(
      center: center,
      width: armWidth,
      height: armLength,
    );
    final clippedVerticalRect = verticalRect.intersect(bounds);
    if (!clippedVerticalRect.isEmpty) {
      canvas.drawRect(clippedVerticalRect, paint);
    }

    // Horizontal arm
    final horizontalRect = Rect.fromCenter(
      center: center,
      width: armLength,
      height: armWidth,
    );
    final clippedHorizontalRect = horizontalRect.intersect(bounds);
    if (!clippedHorizontalRect.isEmpty) {
      canvas.drawRect(clippedHorizontalRect, paint);
    }
  }

  void _drawTriangle(Canvas canvas, Rect bounds, Paint paint) {
    final center = Offset(bounds.center.dx, bounds.center.dy);
    final radius = bounds.width * 0.25; // Scale with square size

    final path = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx - radius * 0.866, center.dy + radius * 0.5)
      ..lineTo(center.dx + radius * 0.866, center.dy + radius * 0.5)
      ..close();

    // Clip the path to bounds
    final clippedPath = Path.combine(
      PathOperation.intersect,
      Path()..addRect(bounds),
      path,
    );

    canvas.drawPath(clippedPath, paint);
  }

  void _drawStar(Canvas canvas, Rect bounds, Paint paint) {
    final center = Offset(bounds.center.dx, bounds.center.dy);
    final outerRadius = bounds.width * 0.25; // Scale with square size
    final innerRadius = outerRadius * 0.4;
    final points = 5;

    final path = Path();
    for (int i = 0; i < points * 2; i++) {
      final radius = i % 2 == 0 ? outerRadius : innerRadius;
      final angle = (i * pi) / points;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // Clip the path to bounds
    final clippedPath = Path.combine(
      PathOperation.intersect,
      Path()..addRect(bounds),
      path,
    );

    canvas.drawPath(clippedPath, paint);
  }

  void _drawWave(Canvas canvas, Rect bounds, Paint paint) {
    final path = Path();
    final amplitude = bounds.height * 0.15; // Scale with square size
    final frequency = 2 * pi / bounds.width;

    path.moveTo(bounds.left, bounds.center.dy);
    for (double x = bounds.left; x < bounds.right; x += bounds.width * 0.05) {
      // Scale step size
      final y = bounds.center.dy + amplitude * sin(frequency * x);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  void _drawZigzag(Canvas canvas, Rect bounds, Paint paint) {
    final path = Path();
    final segmentWidth = bounds.width * 0.125; // Scale with square size (1/8)
    final amplitude = bounds.height * 0.25; // Scale with square size

    path.moveTo(bounds.left, bounds.center.dy);
    for (int i = 1; i <= 8; i++) {
      final x = bounds.left + i * segmentWidth;
      final y = bounds.center.dy + (i % 2 == 0 ? amplitude : -amplitude);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  void _drawQuarterCircle(Canvas canvas, Rect bounds, Paint paint) {
    final radius = min(bounds.width, bounds.height) / 2;
    final center = Offset(bounds.center.dx, bounds.center.dy);

    final path = Path()
      ..moveTo(center.dx - radius, center.dy - radius)
      ..lineTo(center.dx - radius, center.dy + radius)
      ..arcTo(
        Rect.fromLTWH(
          center.dx - radius,
          center.dy - radius,
          2 * radius,
          2 * radius,
        ),
        0,
        pi / 2,
        true,
      )
      ..lineTo(center.dx - radius, center.dy - radius)
      ..close();

    canvas.drawPath(path, paint);
  }

  void _drawInverseQuarterCircle(Canvas canvas, Rect bounds, Paint paint) {
    final radius = min(bounds.width, bounds.height) / 2;
    final center = Offset(bounds.center.dx, bounds.center.dy);

    // Create a square path
    final squarePath = Path()
      ..addRect(
        Rect.fromLTWH(
          center.dx - radius,
          center.dy - radius,
          2 * radius,
          2 * radius,
        ),
      );

    // Create a quarter circle path (the "hole" to cut out)
    final quarterCirclePath = Path()
      ..moveTo(center.dx + radius, center.dy + radius)
      ..lineTo(center.dx - radius, center.dy + radius)
      ..arcTo(
        Rect.fromLTWH(
          center.dx - radius,
          center.dy - radius,
          2 * radius,
          2 * radius,
        ),
        3 * pi / 2,
        pi / 2,
        true,
      )
      ..lineTo(center.dx + radius, center.dy + radius)
      ..close();

    // Subtract the quarter circle from the square
    final resultPath = Path.combine(
      PathOperation.difference,
      squarePath,
      quarterCirclePath,
    );

    canvas.drawPath(resultPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is PatternPainter &&
        (oldDelegate.pattern != pattern || oldDelegate.rotation != rotation);
  }
}
