// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_pattern.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomPattern _$CustomPatternFromJson(Map<String, dynamic> json) {
  return _CustomPattern.fromJson(json);
}

/// @nodoc
mixin _$CustomPattern {
  /// Unique identifier for the custom pattern.
  String get id => throw _privateConstructorUsedError;

  /// Display name for the custom pattern.
  String get name => throw _privateConstructorUsedError;

  /// Grid size (e.g., 8x8, 16x16).
  int get gridSize => throw _privateConstructorUsedError;

  /// Pattern data as a 2D grid of boolean values.
  /// true = filled pixel, false = empty pixel.
  List<List<bool>> get grid => throw _privateConstructorUsedError;

  /// Creation timestamp.
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CustomPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomPatternCopyWith<CustomPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomPatternCopyWith<$Res> {
  factory $CustomPatternCopyWith(
    CustomPattern value,
    $Res Function(CustomPattern) then,
  ) = _$CustomPatternCopyWithImpl<$Res, CustomPattern>;
  @useResult
  $Res call({
    String id,
    String name,
    int gridSize,
    List<List<bool>> grid,
    DateTime createdAt,
  });
}

/// @nodoc
class _$CustomPatternCopyWithImpl<$Res, $Val extends CustomPattern>
    implements $CustomPatternCopyWith<$Res> {
  _$CustomPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gridSize = null,
    Object? grid = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            gridSize: null == gridSize
                ? _value.gridSize
                : gridSize // ignore: cast_nullable_to_non_nullable
                      as int,
            grid: null == grid
                ? _value.grid
                : grid // ignore: cast_nullable_to_non_nullable
                      as List<List<bool>>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomPatternImplCopyWith<$Res>
    implements $CustomPatternCopyWith<$Res> {
  factory _$$CustomPatternImplCopyWith(
    _$CustomPatternImpl value,
    $Res Function(_$CustomPatternImpl) then,
  ) = __$$CustomPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int gridSize,
    List<List<bool>> grid,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$CustomPatternImplCopyWithImpl<$Res>
    extends _$CustomPatternCopyWithImpl<$Res, _$CustomPatternImpl>
    implements _$$CustomPatternImplCopyWith<$Res> {
  __$$CustomPatternImplCopyWithImpl(
    _$CustomPatternImpl _value,
    $Res Function(_$CustomPatternImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gridSize = null,
    Object? grid = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$CustomPatternImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        gridSize: null == gridSize
            ? _value.gridSize
            : gridSize // ignore: cast_nullable_to_non_nullable
                  as int,
        grid: null == grid
            ? _value._grid
            : grid // ignore: cast_nullable_to_non_nullable
                  as List<List<bool>>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomPatternImpl implements _CustomPattern {
  const _$CustomPatternImpl({
    required this.id,
    required this.name,
    required this.gridSize,
    required final List<List<bool>> grid,
    required this.createdAt,
  }) : _grid = grid;

  factory _$CustomPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomPatternImplFromJson(json);

  /// Unique identifier for the custom pattern.
  @override
  final String id;

  /// Display name for the custom pattern.
  @override
  final String name;

  /// Grid size (e.g., 8x8, 16x16).
  @override
  final int gridSize;

  /// Pattern data as a 2D grid of boolean values.
  /// true = filled pixel, false = empty pixel.
  final List<List<bool>> _grid;

  /// Pattern data as a 2D grid of boolean values.
  /// true = filled pixel, false = empty pixel.
  @override
  List<List<bool>> get grid {
    if (_grid is EqualUnmodifiableListView) return _grid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grid);
  }

  /// Creation timestamp.
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CustomPattern(id: $id, name: $name, gridSize: $gridSize, grid: $grid, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomPatternImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gridSize, gridSize) ||
                other.gridSize == gridSize) &&
            const DeepCollectionEquality().equals(other._grid, _grid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    gridSize,
    const DeepCollectionEquality().hash(_grid),
    createdAt,
  );

  /// Create a copy of CustomPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomPatternImplCopyWith<_$CustomPatternImpl> get copyWith =>
      __$$CustomPatternImplCopyWithImpl<_$CustomPatternImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomPatternImplToJson(this);
  }
}

abstract class _CustomPattern implements CustomPattern {
  const factory _CustomPattern({
    required final String id,
    required final String name,
    required final int gridSize,
    required final List<List<bool>> grid,
    required final DateTime createdAt,
  }) = _$CustomPatternImpl;

  factory _CustomPattern.fromJson(Map<String, dynamic> json) =
      _$CustomPatternImpl.fromJson;

  /// Unique identifier for the custom pattern.
  @override
  String get id;

  /// Display name for the custom pattern.
  @override
  String get name;

  /// Grid size (e.g., 8x8, 16x16).
  @override
  int get gridSize;

  /// Pattern data as a 2D grid of boolean values.
  /// true = filled pixel, false = empty pixel.
  @override
  List<List<bool>> get grid;

  /// Creation timestamp.
  @override
  DateTime get createdAt;

  /// Create a copy of CustomPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomPatternImplCopyWith<_$CustomPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
