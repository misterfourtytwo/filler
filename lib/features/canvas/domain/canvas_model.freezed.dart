// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CanvasModel {

/// Unique identifier for the canvas.
 int get id;/// Display name for the canvas.
 String get title;/// Canvas width in pixels.
 int get width;/// Canvas height in pixels.
 int get height;/// Padding/insets around the drawable area.
 int get insets;/// Pixel data with pattern indices and rotations in row-major order.
 List<PixelData> get pixels;/// Color to use for painting patterns.
@ColorConverter() Color get patternPaintColor;/// Background color for the canvas.
@ColorConverter() Color get canvasBackgroundColor;/// Creation timestamp.
 DateTime get createdAt;/// Last update timestamp.
 DateTime get updatedAt;
/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasModelCopyWith<CanvasModel> get copyWith => _$CanvasModelCopyWithImpl<CanvasModel>(this as CanvasModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&const DeepCollectionEquality().equals(other.pixels, pixels)&&(identical(other.patternPaintColor, patternPaintColor) || other.patternPaintColor == patternPaintColor)&&(identical(other.canvasBackgroundColor, canvasBackgroundColor) || other.canvasBackgroundColor == canvasBackgroundColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,width,height,insets,const DeepCollectionEquality().hash(pixels),patternPaintColor,canvasBackgroundColor,createdAt,updatedAt);

@override
String toString() {
  return 'CanvasModel(id: $id, title: $title, width: $width, height: $height, insets: $insets, pixels: $pixels, patternPaintColor: $patternPaintColor, canvasBackgroundColor: $canvasBackgroundColor, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CanvasModelCopyWith<$Res>  {
  factory $CanvasModelCopyWith(CanvasModel value, $Res Function(CanvasModel) _then) = _$CanvasModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, int width, int height, int insets, List<PixelData> pixels,@ColorConverter() Color patternPaintColor,@ColorConverter() Color canvasBackgroundColor, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$CanvasModelCopyWithImpl<$Res>
    implements $CanvasModelCopyWith<$Res> {
  _$CanvasModelCopyWithImpl(this._self, this._then);

  final CanvasModel _self;
  final $Res Function(CanvasModel) _then;

/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? width = null,Object? height = null,Object? insets = null,Object? pixels = null,Object? patternPaintColor = null,Object? canvasBackgroundColor = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as int,pixels: null == pixels ? _self.pixels : pixels // ignore: cast_nullable_to_non_nullable
as List<PixelData>,patternPaintColor: null == patternPaintColor ? _self.patternPaintColor : patternPaintColor // ignore: cast_nullable_to_non_nullable
as Color,canvasBackgroundColor: null == canvasBackgroundColor ? _self.canvasBackgroundColor : canvasBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CanvasModel].
extension CanvasModelPatterns on CanvasModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasModel value)  $default,){
final _that = this;
switch (_that) {
case _CanvasModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasModel value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int width,  int height,  int insets,  List<PixelData> pixels, @ColorConverter()  Color patternPaintColor, @ColorConverter()  Color canvasBackgroundColor,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
return $default(_that.id,_that.title,_that.width,_that.height,_that.insets,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int width,  int height,  int insets,  List<PixelData> pixels, @ColorConverter()  Color patternPaintColor, @ColorConverter()  Color canvasBackgroundColor,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CanvasModel():
return $default(_that.id,_that.title,_that.width,_that.height,_that.insets,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int width,  int height,  int insets,  List<PixelData> pixels, @ColorConverter()  Color patternPaintColor, @ColorConverter()  Color canvasBackgroundColor,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CanvasModel() when $default != null:
return $default(_that.id,_that.title,_that.width,_that.height,_that.insets,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _CanvasModel implements CanvasModel {
  const _CanvasModel({required this.id, required this.title, required this.width, required this.height, required this.insets, required final  List<PixelData> pixels, @ColorConverter() required this.patternPaintColor, @ColorConverter() required this.canvasBackgroundColor, required this.createdAt, required this.updatedAt}): _pixels = pixels;
  

/// Unique identifier for the canvas.
@override final  int id;
/// Display name for the canvas.
@override final  String title;
/// Canvas width in pixels.
@override final  int width;
/// Canvas height in pixels.
@override final  int height;
/// Padding/insets around the drawable area.
@override final  int insets;
/// Pixel data with pattern indices and rotations in row-major order.
 final  List<PixelData> _pixels;
/// Pixel data with pattern indices and rotations in row-major order.
@override List<PixelData> get pixels {
  if (_pixels is EqualUnmodifiableListView) return _pixels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pixels);
}

/// Color to use for painting patterns.
@override@ColorConverter() final  Color patternPaintColor;
/// Background color for the canvas.
@override@ColorConverter() final  Color canvasBackgroundColor;
/// Creation timestamp.
@override final  DateTime createdAt;
/// Last update timestamp.
@override final  DateTime updatedAt;

/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasModelCopyWith<_CanvasModel> get copyWith => __$CanvasModelCopyWithImpl<_CanvasModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&const DeepCollectionEquality().equals(other._pixels, _pixels)&&(identical(other.patternPaintColor, patternPaintColor) || other.patternPaintColor == patternPaintColor)&&(identical(other.canvasBackgroundColor, canvasBackgroundColor) || other.canvasBackgroundColor == canvasBackgroundColor)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,width,height,insets,const DeepCollectionEquality().hash(_pixels),patternPaintColor,canvasBackgroundColor,createdAt,updatedAt);

@override
String toString() {
  return 'CanvasModel(id: $id, title: $title, width: $width, height: $height, insets: $insets, pixels: $pixels, patternPaintColor: $patternPaintColor, canvasBackgroundColor: $canvasBackgroundColor, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CanvasModelCopyWith<$Res> implements $CanvasModelCopyWith<$Res> {
  factory _$CanvasModelCopyWith(_CanvasModel value, $Res Function(_CanvasModel) _then) = __$CanvasModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int width, int height, int insets, List<PixelData> pixels,@ColorConverter() Color patternPaintColor,@ColorConverter() Color canvasBackgroundColor, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$CanvasModelCopyWithImpl<$Res>
    implements _$CanvasModelCopyWith<$Res> {
  __$CanvasModelCopyWithImpl(this._self, this._then);

  final _CanvasModel _self;
  final $Res Function(_CanvasModel) _then;

/// Create a copy of CanvasModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? width = null,Object? height = null,Object? insets = null,Object? pixels = null,Object? patternPaintColor = null,Object? canvasBackgroundColor = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CanvasModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as int,pixels: null == pixels ? _self._pixels : pixels // ignore: cast_nullable_to_non_nullable
as List<PixelData>,patternPaintColor: null == patternPaintColor ? _self.patternPaintColor : patternPaintColor // ignore: cast_nullable_to_non_nullable
as Color,canvasBackgroundColor: null == canvasBackgroundColor ? _self.canvasBackgroundColor : canvasBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
