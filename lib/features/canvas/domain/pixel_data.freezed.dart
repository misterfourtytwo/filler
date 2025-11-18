// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixel_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PixelData {

/// Pattern index (0-11 for built-in patterns).
 int get pattern;/// Rotation angle in radians (0.0, π/2, π, 3π/2).
 double get rotation;
/// Create a copy of PixelData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PixelDataCopyWith<PixelData> get copyWith => _$PixelDataCopyWithImpl<PixelData>(this as PixelData, _$identity);

  /// Serializes this PixelData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PixelData&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.rotation, rotation) || other.rotation == rotation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pattern,rotation);

@override
String toString() {
  return 'PixelData(pattern: $pattern, rotation: $rotation)';
}


}

/// @nodoc
abstract mixin class $PixelDataCopyWith<$Res>  {
  factory $PixelDataCopyWith(PixelData value, $Res Function(PixelData) _then) = _$PixelDataCopyWithImpl;
@useResult
$Res call({
 int pattern, double rotation
});




}
/// @nodoc
class _$PixelDataCopyWithImpl<$Res>
    implements $PixelDataCopyWith<$Res> {
  _$PixelDataCopyWithImpl(this._self, this._then);

  final PixelData _self;
  final $Res Function(PixelData) _then;

/// Create a copy of PixelData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pattern = null,Object? rotation = null,}) {
  return _then(_self.copyWith(
pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as int,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PixelData].
extension PixelDataPatterns on PixelData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PixelData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PixelData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PixelData value)  $default,){
final _that = this;
switch (_that) {
case _PixelData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PixelData value)?  $default,){
final _that = this;
switch (_that) {
case _PixelData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pattern,  double rotation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PixelData() when $default != null:
return $default(_that.pattern,_that.rotation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pattern,  double rotation)  $default,) {final _that = this;
switch (_that) {
case _PixelData():
return $default(_that.pattern,_that.rotation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pattern,  double rotation)?  $default,) {final _that = this;
switch (_that) {
case _PixelData() when $default != null:
return $default(_that.pattern,_that.rotation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PixelData implements PixelData {
  const _PixelData({required this.pattern, this.rotation = 0.0});
  factory _PixelData.fromJson(Map<String, dynamic> json) => _$PixelDataFromJson(json);

/// Pattern index (0-11 for built-in patterns).
@override final  int pattern;
/// Rotation angle in radians (0.0, π/2, π, 3π/2).
@override@JsonKey() final  double rotation;

/// Create a copy of PixelData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PixelDataCopyWith<_PixelData> get copyWith => __$PixelDataCopyWithImpl<_PixelData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PixelDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PixelData&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.rotation, rotation) || other.rotation == rotation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pattern,rotation);

@override
String toString() {
  return 'PixelData(pattern: $pattern, rotation: $rotation)';
}


}

/// @nodoc
abstract mixin class _$PixelDataCopyWith<$Res> implements $PixelDataCopyWith<$Res> {
  factory _$PixelDataCopyWith(_PixelData value, $Res Function(_PixelData) _then) = __$PixelDataCopyWithImpl;
@override @useResult
$Res call({
 int pattern, double rotation
});




}
/// @nodoc
class __$PixelDataCopyWithImpl<$Res>
    implements _$PixelDataCopyWith<$Res> {
  __$PixelDataCopyWithImpl(this._self, this._then);

  final _PixelData _self;
  final $Res Function(_PixelData) _then;

/// Create a copy of PixelData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pattern = null,Object? rotation = null,}) {
  return _then(_PixelData(
pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as int,rotation: null == rotation ? _self.rotation : rotation // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
