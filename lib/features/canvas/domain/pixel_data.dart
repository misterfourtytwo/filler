import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixel_data.freezed.dart';
part 'pixel_data.g.dart';

/// Represents a single pixel with pattern and rotation data.
///
/// Each pixel stores both the pattern index and rotation angle.
/// Rotation is in radians and should be in 90-degree increments (0, π/2, π, 3π/2).
@freezed
class PixelData with _$PixelData {
  /// Creates pixel data with pattern and rotation.
  const factory PixelData({
    /// Pattern index (0-11 for built-in patterns).
    required int pattern,

    /// Rotation angle in radians (0.0, π/2, π, 3π/2).
    @Default(0.0) double rotation,
  }) = _PixelData;

  /// Creates pixel data from JSON.
  factory PixelData.fromJson(Map<String, dynamic> json) =>
      _$PixelDataFromJson(json);
}

/// Extension to provide utility methods for pixel data.
extension PixelDataExtension on PixelData {
  /// Returns the rotation angle in degrees.
  double get rotationDegrees => (rotation * 180) / 3.14159265359;

  /// Returns the next rotation angle in 90-degree increments.
  double get nextRotation {
    const rotations = [
      0.0,
      1.57079632679,
      3.14159265359,
      4.71238898038,
    ]; // 0°, 90°, 180°, 270°
    final currentIndex = rotations.indexOf(rotation);
    final nextIndex = (currentIndex + 1) % rotations.length;
    return rotations[nextIndex];
  }

  /// Creates a copy with the next rotation angle.
  PixelData withNextRotation() => copyWith(rotation: nextRotation);

  /// Creates a copy with the specified rotation angle.
  PixelData withRotation(double newRotation) => copyWith(rotation: newRotation);
}
