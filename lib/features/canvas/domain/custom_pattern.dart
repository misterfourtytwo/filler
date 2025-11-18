import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_pattern.freezed.dart';
part 'custom_pattern.g.dart';

/// Model for custom patterns drawn by users.
///
/// Represents a custom pattern with a grid of boolean values
/// indicating which pixels should be filled in a pattern square.
@freezed
abstract class CustomPattern with _$CustomPattern {
  /// Creates a custom pattern with the given properties.
  const factory CustomPattern({
    /// Unique identifier for the custom pattern.
    required String id,

    /// Display name for the custom pattern.
    required String name,

    /// Grid size (e.g., 8x8, 16x16).
    required int gridSize,

    /// Pattern data as a 2D grid of boolean values.
    /// true = filled pixel, false = empty pixel.
    required List<List<bool>> grid,

    /// Creation timestamp.
    required DateTime createdAt,
  }) = _CustomPattern;

  /// Creates a custom pattern from JSON data.
  factory CustomPattern.fromJson(Map<String, dynamic> json) =>
      _$CustomPatternFromJson(json);

  /// Creates a new custom pattern with default empty grid.
  factory CustomPattern.create({required String name, int gridSize = 8}) {
    final grid = List.generate(
      gridSize,
      (i) => List.generate(gridSize, (j) => false),
    );

    return CustomPattern(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      gridSize: gridSize,
      grid: grid,
      createdAt: DateTime.now(),
    );
  }
}

/// Extension to provide utility methods for custom patterns.
extension CustomPatternExtension on CustomPattern {
  /// Returns the pattern as a JSON string for storage.
  String toJsonString() {
    return jsonEncode(toJson());
  }

  /// Creates a custom pattern from a JSON string.
  static CustomPattern fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return CustomPattern.fromJson(json);
  }

  /// Returns the number of filled pixels in the pattern.
  int get filledPixelCount {
    int count = 0;
    for (final row in grid) {
      for (final pixel in row) {
        if (pixel) count++;
      }
    }
    return count;
  }

  /// Returns the fill percentage of the pattern (0.0 to 1.0).
  double get fillPercentage {
    final totalPixels = gridSize * gridSize;
    return filledPixelCount / totalPixels;
  }

  /// Returns true if the pattern is empty (no filled pixels).
  bool get isEmpty => filledPixelCount == 0;

  /// Returns true if the pattern is completely filled.
  bool get isFilled => filledPixelCount == gridSize * gridSize;
}
