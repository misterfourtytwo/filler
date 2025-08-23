import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_model.freezed.dart';
part 'preferences_model.g.dart';

/// Immutable user preferences model for default canvas settings.
///
/// Contains default values for new canvases including dimensions,
/// insets, default painting pattern, and theme mode preference.
/// Used by the preferences screen and canvas creation flow.
@freezed
class PreferencesModel with _$PreferencesModel {
  /// Creates a preferences model with default canvas settings.
  const factory PreferencesModel({
    /// Default canvas width for new canvases.
    required int width,

    /// Default canvas height for new canvases.
    required int height,

    /// Default insets/padding for new canvases.
    required int insets,

    /// Default painting pattern as integer index.
    required int defaultPattern,

    /// Theme mode preference (0=light, 1=dark, 2=system).
    @Default(2) int themeMode,
  }) = _PreferencesModel;

  /// Creates preferences from JSON data.
  factory PreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$PreferencesModelFromJson(json);
}
