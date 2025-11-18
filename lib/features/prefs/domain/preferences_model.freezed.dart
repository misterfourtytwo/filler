// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreferencesModel {

/// Default canvas width for new canvases.
 int get width;/// Default canvas height for new canvases.
 int get height;/// Default insets/padding for new canvases.
 int get insets;/// Default painting pattern as integer index.
 int get defaultPattern;/// Theme mode preference (0=light, 1=dark, 2=system).
 int get themeMode;
/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesModelCopyWith<PreferencesModel> get copyWith => _$PreferencesModelCopyWithImpl<PreferencesModel>(this as PreferencesModel, _$identity);

  /// Serializes this PreferencesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesModel&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&(identical(other.defaultPattern, defaultPattern) || other.defaultPattern == defaultPattern)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,insets,defaultPattern,themeMode);

@override
String toString() {
  return 'PreferencesModel(width: $width, height: $height, insets: $insets, defaultPattern: $defaultPattern, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $PreferencesModelCopyWith<$Res>  {
  factory $PreferencesModelCopyWith(PreferencesModel value, $Res Function(PreferencesModel) _then) = _$PreferencesModelCopyWithImpl;
@useResult
$Res call({
 int width, int height, int insets, int defaultPattern, int themeMode
});




}
/// @nodoc
class _$PreferencesModelCopyWithImpl<$Res>
    implements $PreferencesModelCopyWith<$Res> {
  _$PreferencesModelCopyWithImpl(this._self, this._then);

  final PreferencesModel _self;
  final $Res Function(PreferencesModel) _then;

/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = null,Object? height = null,Object? insets = null,Object? defaultPattern = null,Object? themeMode = null,}) {
  return _then(_self.copyWith(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as int,defaultPattern: null == defaultPattern ? _self.defaultPattern : defaultPattern // ignore: cast_nullable_to_non_nullable
as int,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferencesModel].
extension PreferencesModelPatterns on PreferencesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferencesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferencesModel value)  $default,){
final _that = this;
switch (_that) {
case _PreferencesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferencesModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int width,  int height,  int insets,  int defaultPattern,  int themeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
return $default(_that.width,_that.height,_that.insets,_that.defaultPattern,_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int width,  int height,  int insets,  int defaultPattern,  int themeMode)  $default,) {final _that = this;
switch (_that) {
case _PreferencesModel():
return $default(_that.width,_that.height,_that.insets,_that.defaultPattern,_that.themeMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int width,  int height,  int insets,  int defaultPattern,  int themeMode)?  $default,) {final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
return $default(_that.width,_that.height,_that.insets,_that.defaultPattern,_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreferencesModel implements PreferencesModel {
  const _PreferencesModel({required this.width, required this.height, required this.insets, required this.defaultPattern, this.themeMode = 2});
  factory _PreferencesModel.fromJson(Map<String, dynamic> json) => _$PreferencesModelFromJson(json);

/// Default canvas width for new canvases.
@override final  int width;
/// Default canvas height for new canvases.
@override final  int height;
/// Default insets/padding for new canvases.
@override final  int insets;
/// Default painting pattern as integer index.
@override final  int defaultPattern;
/// Theme mode preference (0=light, 1=dark, 2=system).
@override@JsonKey() final  int themeMode;

/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferencesModelCopyWith<_PreferencesModel> get copyWith => __$PreferencesModelCopyWithImpl<_PreferencesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreferencesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferencesModel&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&(identical(other.defaultPattern, defaultPattern) || other.defaultPattern == defaultPattern)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,insets,defaultPattern,themeMode);

@override
String toString() {
  return 'PreferencesModel(width: $width, height: $height, insets: $insets, defaultPattern: $defaultPattern, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$PreferencesModelCopyWith<$Res> implements $PreferencesModelCopyWith<$Res> {
  factory _$PreferencesModelCopyWith(_PreferencesModel value, $Res Function(_PreferencesModel) _then) = __$PreferencesModelCopyWithImpl;
@override @useResult
$Res call({
 int width, int height, int insets, int defaultPattern, int themeMode
});




}
/// @nodoc
class __$PreferencesModelCopyWithImpl<$Res>
    implements _$PreferencesModelCopyWith<$Res> {
  __$PreferencesModelCopyWithImpl(this._self, this._then);

  final _PreferencesModel _self;
  final $Res Function(_PreferencesModel) _then;

/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,Object? insets = null,Object? defaultPattern = null,Object? themeMode = null,}) {
  return _then(_PreferencesModel(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as int,defaultPattern: null == defaultPattern ? _self.defaultPattern : defaultPattern // ignore: cast_nullable_to_non_nullable
as int,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
