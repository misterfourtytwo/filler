// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_pattern.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomPattern {

/// Unique identifier for the custom pattern.
 String get id;/// Display name for the custom pattern.
 String get name;/// Grid size (e.g., 8x8, 16x16).
 int get gridSize;/// Pattern data as a 2D grid of boolean values.
/// true = filled pixel, false = empty pixel.
 List<List<bool>> get grid;/// Creation timestamp.
 DateTime get createdAt;
/// Create a copy of CustomPattern
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomPatternCopyWith<CustomPattern> get copyWith => _$CustomPatternCopyWithImpl<CustomPattern>(this as CustomPattern, _$identity);

  /// Serializes this CustomPattern to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomPattern&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.gridSize, gridSize) || other.gridSize == gridSize)&&const DeepCollectionEquality().equals(other.grid, grid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,gridSize,const DeepCollectionEquality().hash(grid),createdAt);

@override
String toString() {
  return 'CustomPattern(id: $id, name: $name, gridSize: $gridSize, grid: $grid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CustomPatternCopyWith<$Res>  {
  factory $CustomPatternCopyWith(CustomPattern value, $Res Function(CustomPattern) _then) = _$CustomPatternCopyWithImpl;
@useResult
$Res call({
 String id, String name, int gridSize, List<List<bool>> grid, DateTime createdAt
});




}
/// @nodoc
class _$CustomPatternCopyWithImpl<$Res>
    implements $CustomPatternCopyWith<$Res> {
  _$CustomPatternCopyWithImpl(this._self, this._then);

  final CustomPattern _self;
  final $Res Function(CustomPattern) _then;

/// Create a copy of CustomPattern
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? gridSize = null,Object? grid = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gridSize: null == gridSize ? _self.gridSize : gridSize // ignore: cast_nullable_to_non_nullable
as int,grid: null == grid ? _self.grid : grid // ignore: cast_nullable_to_non_nullable
as List<List<bool>>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomPattern].
extension CustomPatternPatterns on CustomPattern {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomPattern value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomPattern() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomPattern value)  $default,){
final _that = this;
switch (_that) {
case _CustomPattern():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomPattern value)?  $default,){
final _that = this;
switch (_that) {
case _CustomPattern() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int gridSize,  List<List<bool>> grid,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomPattern() when $default != null:
return $default(_that.id,_that.name,_that.gridSize,_that.grid,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int gridSize,  List<List<bool>> grid,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CustomPattern():
return $default(_that.id,_that.name,_that.gridSize,_that.grid,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int gridSize,  List<List<bool>> grid,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CustomPattern() when $default != null:
return $default(_that.id,_that.name,_that.gridSize,_that.grid,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomPattern implements CustomPattern {
  const _CustomPattern({required this.id, required this.name, required this.gridSize, required final  List<List<bool>> grid, required this.createdAt}): _grid = grid;
  factory _CustomPattern.fromJson(Map<String, dynamic> json) => _$CustomPatternFromJson(json);

/// Unique identifier for the custom pattern.
@override final  String id;
/// Display name for the custom pattern.
@override final  String name;
/// Grid size (e.g., 8x8, 16x16).
@override final  int gridSize;
/// Pattern data as a 2D grid of boolean values.
/// true = filled pixel, false = empty pixel.
 final  List<List<bool>> _grid;
/// Pattern data as a 2D grid of boolean values.
/// true = filled pixel, false = empty pixel.
@override List<List<bool>> get grid {
  if (_grid is EqualUnmodifiableListView) return _grid;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_grid);
}

/// Creation timestamp.
@override final  DateTime createdAt;

/// Create a copy of CustomPattern
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomPatternCopyWith<_CustomPattern> get copyWith => __$CustomPatternCopyWithImpl<_CustomPattern>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomPatternToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomPattern&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.gridSize, gridSize) || other.gridSize == gridSize)&&const DeepCollectionEquality().equals(other._grid, _grid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,gridSize,const DeepCollectionEquality().hash(_grid),createdAt);

@override
String toString() {
  return 'CustomPattern(id: $id, name: $name, gridSize: $gridSize, grid: $grid, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CustomPatternCopyWith<$Res> implements $CustomPatternCopyWith<$Res> {
  factory _$CustomPatternCopyWith(_CustomPattern value, $Res Function(_CustomPattern) _then) = __$CustomPatternCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int gridSize, List<List<bool>> grid, DateTime createdAt
});




}
/// @nodoc
class __$CustomPatternCopyWithImpl<$Res>
    implements _$CustomPatternCopyWith<$Res> {
  __$CustomPatternCopyWithImpl(this._self, this._then);

  final _CustomPattern _self;
  final $Res Function(_CustomPattern) _then;

/// Create a copy of CustomPattern
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? gridSize = null,Object? grid = null,Object? createdAt = null,}) {
  return _then(_CustomPattern(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gridSize: null == gridSize ? _self.gridSize : gridSize // ignore: cast_nullable_to_non_nullable
as int,grid: null == grid ? _self._grid : grid // ignore: cast_nullable_to_non_nullable
as List<List<bool>>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
