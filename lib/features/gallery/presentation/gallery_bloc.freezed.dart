// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryEvent()';
}


}

/// @nodoc
class $GalleryEventCopyWith<$Res>  {
$GalleryEventCopyWith(GalleryEvent _, $Res Function(GalleryEvent) __);
}


/// Adds pattern-matching-related methods to [GalleryEvent].
extension GalleryEventPatterns on GalleryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _Delete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Delete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _Delete value)  delete,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _Delete():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _Delete value)?  delete,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _Delete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( int canvasId)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Delete() when delete != null:
return delete(_that.canvasId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( int canvasId)  delete,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _Delete():
return delete(_that.canvasId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( int canvasId)?  delete,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _Delete() when delete != null:
return delete(_that.canvasId);case _:
  return null;

}
}

}

/// @nodoc


class _Load implements GalleryEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryEvent.load()';
}


}




/// @nodoc


class _Delete implements GalleryEvent {
  const _Delete(this.canvasId);
  

 final  int canvasId;

/// Create a copy of GalleryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteCopyWith<_Delete> get copyWith => __$DeleteCopyWithImpl<_Delete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delete&&(identical(other.canvasId, canvasId) || other.canvasId == canvasId));
}


@override
int get hashCode => Object.hash(runtimeType,canvasId);

@override
String toString() {
  return 'GalleryEvent.delete(canvasId: $canvasId)';
}


}

/// @nodoc
abstract mixin class _$DeleteCopyWith<$Res> implements $GalleryEventCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) _then) = __$DeleteCopyWithImpl;
@useResult
$Res call({
 int canvasId
});




}
/// @nodoc
class __$DeleteCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(this._self, this._then);

  final _Delete _self;
  final $Res Function(_Delete) _then;

/// Create a copy of GalleryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? canvasId = null,}) {
  return _then(_Delete(
null == canvasId ? _self.canvasId : canvasId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$GalleryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryState()';
}


}

/// @nodoc
class $GalleryStateCopyWith<$Res>  {
$GalleryStateCopyWith(GalleryState _, $Res Function(GalleryState) __);
}


/// Adds pattern-matching-related methods to [GalleryState].
extension GalleryStatePatterns on GalleryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<GalleryItem> items)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<GalleryItem> items)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<GalleryItem> items)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements GalleryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryState.initial()';
}


}




/// @nodoc


class _Loading implements GalleryState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GalleryState.loading()';
}


}




/// @nodoc


class _Loaded implements GalleryState {
  const _Loaded({required final  List<GalleryItem> items}): _items = items;
  

 final  List<GalleryItem> _items;
 List<GalleryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'GalleryState.loaded(items: $items)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $GalleryStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<GalleryItem> items
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_Loaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<GalleryItem>,
  ));
}


}

/// @nodoc
mixin _$GalleryItem {

/// Unique canvas identifier.
 int get id;/// Canvas width in pixels.
 int get width;/// Canvas height in pixels.
 int get height;/// Canvas padding/insets.
 int get insets;/// Pixel data with pattern indices and rotations in row-major order.
 List<PixelData> get pixels;/// Color to use for painting patterns.
 Color get patternPaintColor;/// Background color for the canvas.
 Color get canvasBackgroundColor;
/// Create a copy of GalleryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryItemCopyWith<GalleryItem> get copyWith => _$GalleryItemCopyWithImpl<GalleryItem>(this as GalleryItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&const DeepCollectionEquality().equals(other.pixels, pixels)&&(identical(other.patternPaintColor, patternPaintColor) || other.patternPaintColor == patternPaintColor)&&(identical(other.canvasBackgroundColor, canvasBackgroundColor) || other.canvasBackgroundColor == canvasBackgroundColor));
}


@override
int get hashCode => Object.hash(runtimeType,id,width,height,insets,const DeepCollectionEquality().hash(pixels),patternPaintColor,canvasBackgroundColor);

@override
String toString() {
  return 'GalleryItem(id: $id, width: $width, height: $height, insets: $insets, pixels: $pixels, patternPaintColor: $patternPaintColor, canvasBackgroundColor: $canvasBackgroundColor)';
}


}

/// @nodoc
abstract mixin class $GalleryItemCopyWith<$Res>  {
  factory $GalleryItemCopyWith(GalleryItem value, $Res Function(GalleryItem) _then) = _$GalleryItemCopyWithImpl;
@useResult
$Res call({
 int id, int width, int height, int insets, List<PixelData> pixels, Color patternPaintColor, Color canvasBackgroundColor
});




}
/// @nodoc
class _$GalleryItemCopyWithImpl<$Res>
    implements $GalleryItemCopyWith<$Res> {
  _$GalleryItemCopyWithImpl(this._self, this._then);

  final GalleryItem _self;
  final $Res Function(GalleryItem) _then;

/// Create a copy of GalleryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? width = null,Object? height = null,Object? insets = null,Object? pixels = null,Object? patternPaintColor = null,Object? canvasBackgroundColor = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as int,pixels: null == pixels ? _self.pixels : pixels // ignore: cast_nullable_to_non_nullable
as List<PixelData>,patternPaintColor: null == patternPaintColor ? _self.patternPaintColor : patternPaintColor // ignore: cast_nullable_to_non_nullable
as Color,canvasBackgroundColor: null == canvasBackgroundColor ? _self.canvasBackgroundColor : canvasBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryItem].
extension GalleryItemPatterns on GalleryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryItem value)  $default,){
final _that = this;
switch (_that) {
case _GalleryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryItem value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int width,  int height,  int insets,  List<PixelData> pixels,  Color patternPaintColor,  Color canvasBackgroundColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryItem() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.insets,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int width,  int height,  int insets,  List<PixelData> pixels,  Color patternPaintColor,  Color canvasBackgroundColor)  $default,) {final _that = this;
switch (_that) {
case _GalleryItem():
return $default(_that.id,_that.width,_that.height,_that.insets,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int width,  int height,  int insets,  List<PixelData> pixels,  Color patternPaintColor,  Color canvasBackgroundColor)?  $default,) {final _that = this;
switch (_that) {
case _GalleryItem() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.insets,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor);case _:
  return null;

}
}

}

/// @nodoc


class _GalleryItem implements GalleryItem {
  const _GalleryItem({required this.id, required this.width, required this.height, required this.insets, required final  List<PixelData> pixels, required this.patternPaintColor, required this.canvasBackgroundColor}): _pixels = pixels;
  

/// Unique canvas identifier.
@override final  int id;
/// Canvas width in pixels.
@override final  int width;
/// Canvas height in pixels.
@override final  int height;
/// Canvas padding/insets.
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
@override final  Color patternPaintColor;
/// Background color for the canvas.
@override final  Color canvasBackgroundColor;

/// Create a copy of GalleryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryItemCopyWith<_GalleryItem> get copyWith => __$GalleryItemCopyWithImpl<_GalleryItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&const DeepCollectionEquality().equals(other._pixels, _pixels)&&(identical(other.patternPaintColor, patternPaintColor) || other.patternPaintColor == patternPaintColor)&&(identical(other.canvasBackgroundColor, canvasBackgroundColor) || other.canvasBackgroundColor == canvasBackgroundColor));
}


@override
int get hashCode => Object.hash(runtimeType,id,width,height,insets,const DeepCollectionEquality().hash(_pixels),patternPaintColor,canvasBackgroundColor);

@override
String toString() {
  return 'GalleryItem(id: $id, width: $width, height: $height, insets: $insets, pixels: $pixels, patternPaintColor: $patternPaintColor, canvasBackgroundColor: $canvasBackgroundColor)';
}


}

/// @nodoc
abstract mixin class _$GalleryItemCopyWith<$Res> implements $GalleryItemCopyWith<$Res> {
  factory _$GalleryItemCopyWith(_GalleryItem value, $Res Function(_GalleryItem) _then) = __$GalleryItemCopyWithImpl;
@override @useResult
$Res call({
 int id, int width, int height, int insets, List<PixelData> pixels, Color patternPaintColor, Color canvasBackgroundColor
});




}
/// @nodoc
class __$GalleryItemCopyWithImpl<$Res>
    implements _$GalleryItemCopyWith<$Res> {
  __$GalleryItemCopyWithImpl(this._self, this._then);

  final _GalleryItem _self;
  final $Res Function(_GalleryItem) _then;

/// Create a copy of GalleryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? width = null,Object? height = null,Object? insets = null,Object? pixels = null,Object? patternPaintColor = null,Object? canvasBackgroundColor = null,}) {
  return _then(_GalleryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as int,pixels: null == pixels ? _self._pixels : pixels // ignore: cast_nullable_to_non_nullable
as List<PixelData>,patternPaintColor: null == patternPaintColor ? _self.patternPaintColor : patternPaintColor // ignore: cast_nullable_to_non_nullable
as Color,canvasBackgroundColor: null == canvasBackgroundColor ? _self.canvasBackgroundColor : canvasBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
