import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'pixel_data.dart';

part 'canvas_model.freezed.dart';

/// JSON converter for Color objects.
class ColorConverter implements JsonConverter<Color, int> {
  /// Creates a color converter.
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.toARGB32();
}

/// Immutable canvas model for domain layer operations.
///
/// Represents a pixel art canvas with dimensions, title, pixel data, colors, and timestamps.
/// Uses Freezed for immutability. Note: JSON serialization removed to avoid circular dependencies.
/// Pixel data is stored as a flat list of PixelData objects in row-major order.
@freezed
abstract class CanvasModel with _$CanvasModel {
  /// Creates a canvas model with the given properties.
  const factory CanvasModel({
    /// Unique identifier for the canvas.
    required int id,

    /// Display name for the canvas.
    required String title,

    /// Canvas width in pixels.
    required int width,

    /// Canvas height in pixels.
    required int height,

    /// Padding/insets around the drawable area.
    required int insets,

    /// Pixel data with pattern indices and rotations in row-major order.
    required List<PixelData> pixels,

    /// Color to use for painting patterns.
    @ColorConverter() required Color patternPaintColor,

    /// Background color for the canvas.
    @ColorConverter() required Color canvasBackgroundColor,

    /// Creation timestamp.
    required DateTime createdAt,

    /// Last update timestamp.
    required DateTime updatedAt,
  }) = _CanvasModel;
}
