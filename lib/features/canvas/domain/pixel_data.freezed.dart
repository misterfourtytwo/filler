// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixel_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PixelData _$PixelDataFromJson(Map<String, dynamic> json) {
  return _PixelData.fromJson(json);
}

/// @nodoc
mixin _$PixelData {
  /// Pattern index (0-11 for built-in patterns).
  int get pattern => throw _privateConstructorUsedError;

  /// Rotation angle in radians (0.0, π/2, π, 3π/2).
  double get rotation => throw _privateConstructorUsedError;

  /// Serializes this PixelData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PixelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PixelDataCopyWith<PixelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixelDataCopyWith<$Res> {
  factory $PixelDataCopyWith(PixelData value, $Res Function(PixelData) then) =
      _$PixelDataCopyWithImpl<$Res, PixelData>;
  @useResult
  $Res call({int pattern, double rotation});
}

/// @nodoc
class _$PixelDataCopyWithImpl<$Res, $Val extends PixelData>
    implements $PixelDataCopyWith<$Res> {
  _$PixelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PixelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pattern = null, Object? rotation = null}) {
    return _then(
      _value.copyWith(
            pattern: null == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as int,
            rotation: null == rotation
                ? _value.rotation
                : rotation // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PixelDataImplCopyWith<$Res>
    implements $PixelDataCopyWith<$Res> {
  factory _$$PixelDataImplCopyWith(
    _$PixelDataImpl value,
    $Res Function(_$PixelDataImpl) then,
  ) = __$$PixelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pattern, double rotation});
}

/// @nodoc
class __$$PixelDataImplCopyWithImpl<$Res>
    extends _$PixelDataCopyWithImpl<$Res, _$PixelDataImpl>
    implements _$$PixelDataImplCopyWith<$Res> {
  __$$PixelDataImplCopyWithImpl(
    _$PixelDataImpl _value,
    $Res Function(_$PixelDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PixelData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pattern = null, Object? rotation = null}) {
    return _then(
      _$PixelDataImpl(
        pattern: null == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as int,
        rotation: null == rotation
            ? _value.rotation
            : rotation // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PixelDataImpl implements _PixelData {
  const _$PixelDataImpl({required this.pattern, this.rotation = 0.0});

  factory _$PixelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PixelDataImplFromJson(json);

  /// Pattern index (0-11 for built-in patterns).
  @override
  final int pattern;

  /// Rotation angle in radians (0.0, π/2, π, 3π/2).
  @override
  @JsonKey()
  final double rotation;

  @override
  String toString() {
    return 'PixelData(pattern: $pattern, rotation: $rotation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PixelDataImpl &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pattern, rotation);

  /// Create a copy of PixelData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PixelDataImplCopyWith<_$PixelDataImpl> get copyWith =>
      __$$PixelDataImplCopyWithImpl<_$PixelDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PixelDataImplToJson(this);
  }
}

abstract class _PixelData implements PixelData {
  const factory _PixelData({
    required final int pattern,
    final double rotation,
  }) = _$PixelDataImpl;

  factory _PixelData.fromJson(Map<String, dynamic> json) =
      _$PixelDataImpl.fromJson;

  /// Pattern index (0-11 for built-in patterns).
  @override
  int get pattern;

  /// Rotation angle in radians (0.0, π/2, π, 3π/2).
  @override
  double get rotation;

  /// Create a copy of PixelData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PixelDataImplCopyWith<_$PixelDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
