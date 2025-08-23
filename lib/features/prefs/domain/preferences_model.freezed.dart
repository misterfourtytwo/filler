// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PreferencesModel _$PreferencesModelFromJson(Map<String, dynamic> json) {
  return _PreferencesModel.fromJson(json);
}

/// @nodoc
mixin _$PreferencesModel {
  /// Default canvas width for new canvases.
  int get width => throw _privateConstructorUsedError;

  /// Default canvas height for new canvases.
  int get height => throw _privateConstructorUsedError;

  /// Default insets/padding for new canvases.
  int get insets => throw _privateConstructorUsedError;

  /// Default painting pattern as integer index.
  int get defaultPattern => throw _privateConstructorUsedError;

  /// Theme mode preference (0=light, 1=dark, 2=system).
  int get themeMode => throw _privateConstructorUsedError;

  /// Serializes this PreferencesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferencesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferencesModelCopyWith<PreferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesModelCopyWith<$Res> {
  factory $PreferencesModelCopyWith(
    PreferencesModel value,
    $Res Function(PreferencesModel) then,
  ) = _$PreferencesModelCopyWithImpl<$Res, PreferencesModel>;
  @useResult
  $Res call({
    int width,
    int height,
    int insets,
    int defaultPattern,
    int themeMode,
  });
}

/// @nodoc
class _$PreferencesModelCopyWithImpl<$Res, $Val extends PreferencesModel>
    implements $PreferencesModelCopyWith<$Res> {
  _$PreferencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferencesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? insets = null,
    Object? defaultPattern = null,
    Object? themeMode = null,
  }) {
    return _then(
      _value.copyWith(
            width: null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as int,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as int,
            insets: null == insets
                ? _value.insets
                : insets // ignore: cast_nullable_to_non_nullable
                      as int,
            defaultPattern: null == defaultPattern
                ? _value.defaultPattern
                : defaultPattern // ignore: cast_nullable_to_non_nullable
                      as int,
            themeMode: null == themeMode
                ? _value.themeMode
                : themeMode // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PreferencesModelImplCopyWith<$Res>
    implements $PreferencesModelCopyWith<$Res> {
  factory _$$PreferencesModelImplCopyWith(
    _$PreferencesModelImpl value,
    $Res Function(_$PreferencesModelImpl) then,
  ) = __$$PreferencesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int width,
    int height,
    int insets,
    int defaultPattern,
    int themeMode,
  });
}

/// @nodoc
class __$$PreferencesModelImplCopyWithImpl<$Res>
    extends _$PreferencesModelCopyWithImpl<$Res, _$PreferencesModelImpl>
    implements _$$PreferencesModelImplCopyWith<$Res> {
  __$$PreferencesModelImplCopyWithImpl(
    _$PreferencesModelImpl _value,
    $Res Function(_$PreferencesModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PreferencesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? insets = null,
    Object? defaultPattern = null,
    Object? themeMode = null,
  }) {
    return _then(
      _$PreferencesModelImpl(
        width: null == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as int,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as int,
        insets: null == insets
            ? _value.insets
            : insets // ignore: cast_nullable_to_non_nullable
                  as int,
        defaultPattern: null == defaultPattern
            ? _value.defaultPattern
            : defaultPattern // ignore: cast_nullable_to_non_nullable
                  as int,
        themeMode: null == themeMode
            ? _value.themeMode
            : themeMode // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PreferencesModelImpl implements _PreferencesModel {
  const _$PreferencesModelImpl({
    required this.width,
    required this.height,
    required this.insets,
    required this.defaultPattern,
    this.themeMode = 2,
  });

  factory _$PreferencesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesModelImplFromJson(json);

  /// Default canvas width for new canvases.
  @override
  final int width;

  /// Default canvas height for new canvases.
  @override
  final int height;

  /// Default insets/padding for new canvases.
  @override
  final int insets;

  /// Default painting pattern as integer index.
  @override
  final int defaultPattern;

  /// Theme mode preference (0=light, 1=dark, 2=system).
  @override
  @JsonKey()
  final int themeMode;

  @override
  String toString() {
    return 'PreferencesModel(width: $width, height: $height, insets: $insets, defaultPattern: $defaultPattern, themeMode: $themeMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesModelImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.insets, insets) || other.insets == insets) &&
            (identical(other.defaultPattern, defaultPattern) ||
                other.defaultPattern == defaultPattern) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    width,
    height,
    insets,
    defaultPattern,
    themeMode,
  );

  /// Create a copy of PreferencesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesModelImplCopyWith<_$PreferencesModelImpl> get copyWith =>
      __$$PreferencesModelImplCopyWithImpl<_$PreferencesModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesModelImplToJson(this);
  }
}

abstract class _PreferencesModel implements PreferencesModel {
  const factory _PreferencesModel({
    required final int width,
    required final int height,
    required final int insets,
    required final int defaultPattern,
    final int themeMode,
  }) = _$PreferencesModelImpl;

  factory _PreferencesModel.fromJson(Map<String, dynamic> json) =
      _$PreferencesModelImpl.fromJson;

  /// Default canvas width for new canvases.
  @override
  int get width;

  /// Default canvas height for new canvases.
  @override
  int get height;

  /// Default insets/padding for new canvases.
  @override
  int get insets;

  /// Default painting pattern as integer index.
  @override
  int get defaultPattern;

  /// Theme mode preference (0=light, 1=dark, 2=system).
  @override
  int get themeMode;

  /// Create a copy of PreferencesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesModelImplCopyWith<_$PreferencesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
