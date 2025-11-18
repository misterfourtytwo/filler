// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CanvasEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CanvasEvent()';
}


}

/// @nodoc
class $CanvasEventCopyWith<$Res>  {
$CanvasEventCopyWith(CanvasEvent _, $Res Function(CanvasEvent) __);
}


/// Adds pattern-matching-related methods to [CanvasEvent].
extension CanvasEventPatterns on CanvasEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Init value)?  init,TResult Function( _Load value)?  load,TResult Function( _SetactivePatternId value)?  setactivePatternId,TResult Function( _RotatePattern value)?  rotatePattern,TResult Function( _SetCustomPattern value)?  setCustomPattern,TResult Function( _Paint value)?  paint,TResult Function( _RotatePixel value)?  rotatePixel,TResult Function( _Fill value)?  fill,TResult Function( _Save value)?  save,TResult Function( _SetPatternPaintColor value)?  setPatternPaintColor,TResult Function( _SetCanvasBackgroundColor value)?  setCanvasBackgroundColor,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Load() when load != null:
return load(_that);case _SetactivePatternId() when setactivePatternId != null:
return setactivePatternId(_that);case _RotatePattern() when rotatePattern != null:
return rotatePattern(_that);case _SetCustomPattern() when setCustomPattern != null:
return setCustomPattern(_that);case _Paint() when paint != null:
return paint(_that);case _RotatePixel() when rotatePixel != null:
return rotatePixel(_that);case _Fill() when fill != null:
return fill(_that);case _Save() when save != null:
return save(_that);case _SetPatternPaintColor() when setPatternPaintColor != null:
return setPatternPaintColor(_that);case _SetCanvasBackgroundColor() when setCanvasBackgroundColor != null:
return setCanvasBackgroundColor(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Init value)  init,required TResult Function( _Load value)  load,required TResult Function( _SetactivePatternId value)  setactivePatternId,required TResult Function( _RotatePattern value)  rotatePattern,required TResult Function( _SetCustomPattern value)  setCustomPattern,required TResult Function( _Paint value)  paint,required TResult Function( _RotatePixel value)  rotatePixel,required TResult Function( _Fill value)  fill,required TResult Function( _Save value)  save,required TResult Function( _SetPatternPaintColor value)  setPatternPaintColor,required TResult Function( _SetCanvasBackgroundColor value)  setCanvasBackgroundColor,}){
final _that = this;
switch (_that) {
case _Init():
return init(_that);case _Load():
return load(_that);case _SetactivePatternId():
return setactivePatternId(_that);case _RotatePattern():
return rotatePattern(_that);case _SetCustomPattern():
return setCustomPattern(_that);case _Paint():
return paint(_that);case _RotatePixel():
return rotatePixel(_that);case _Fill():
return fill(_that);case _Save():
return save(_that);case _SetPatternPaintColor():
return setPatternPaintColor(_that);case _SetCanvasBackgroundColor():
return setCanvasBackgroundColor(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Init value)?  init,TResult? Function( _Load value)?  load,TResult? Function( _SetactivePatternId value)?  setactivePatternId,TResult? Function( _RotatePattern value)?  rotatePattern,TResult? Function( _SetCustomPattern value)?  setCustomPattern,TResult? Function( _Paint value)?  paint,TResult? Function( _RotatePixel value)?  rotatePixel,TResult? Function( _Fill value)?  fill,TResult? Function( _Save value)?  save,TResult? Function( _SetPatternPaintColor value)?  setPatternPaintColor,TResult? Function( _SetCanvasBackgroundColor value)?  setCanvasBackgroundColor,}){
final _that = this;
switch (_that) {
case _Init() when init != null:
return init(_that);case _Load() when load != null:
return load(_that);case _SetactivePatternId() when setactivePatternId != null:
return setactivePatternId(_that);case _RotatePattern() when rotatePattern != null:
return rotatePattern(_that);case _SetCustomPattern() when setCustomPattern != null:
return setCustomPattern(_that);case _Paint() when paint != null:
return paint(_that);case _RotatePixel() when rotatePixel != null:
return rotatePixel(_that);case _Fill() when fill != null:
return fill(_that);case _Save() when save != null:
return save(_that);case _SetPatternPaintColor() when setPatternPaintColor != null:
return setPatternPaintColor(_that);case _SetCanvasBackgroundColor() when setCanvasBackgroundColor != null:
return setCanvasBackgroundColor(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function( int canvasId)?  load,TResult Function( int pattern)?  setactivePatternId,TResult Function( double angle)?  rotatePattern,TResult Function( CustomPattern pattern)?  setCustomPattern,TResult Function( int index)?  paint,TResult Function( int index)?  rotatePixel,TResult Function()?  fill,TResult Function( String title)?  save,TResult Function( Color color)?  setPatternPaintColor,TResult Function( Color color)?  setCanvasBackgroundColor,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Load() when load != null:
return load(_that.canvasId);case _SetactivePatternId() when setactivePatternId != null:
return setactivePatternId(_that.pattern);case _RotatePattern() when rotatePattern != null:
return rotatePattern(_that.angle);case _SetCustomPattern() when setCustomPattern != null:
return setCustomPattern(_that.pattern);case _Paint() when paint != null:
return paint(_that.index);case _RotatePixel() when rotatePixel != null:
return rotatePixel(_that.index);case _Fill() when fill != null:
return fill();case _Save() when save != null:
return save(_that.title);case _SetPatternPaintColor() when setPatternPaintColor != null:
return setPatternPaintColor(_that.color);case _SetCanvasBackgroundColor() when setCanvasBackgroundColor != null:
return setCanvasBackgroundColor(_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function( int canvasId)  load,required TResult Function( int pattern)  setactivePatternId,required TResult Function( double angle)  rotatePattern,required TResult Function( CustomPattern pattern)  setCustomPattern,required TResult Function( int index)  paint,required TResult Function( int index)  rotatePixel,required TResult Function()  fill,required TResult Function( String title)  save,required TResult Function( Color color)  setPatternPaintColor,required TResult Function( Color color)  setCanvasBackgroundColor,}) {final _that = this;
switch (_that) {
case _Init():
return init();case _Load():
return load(_that.canvasId);case _SetactivePatternId():
return setactivePatternId(_that.pattern);case _RotatePattern():
return rotatePattern(_that.angle);case _SetCustomPattern():
return setCustomPattern(_that.pattern);case _Paint():
return paint(_that.index);case _RotatePixel():
return rotatePixel(_that.index);case _Fill():
return fill();case _Save():
return save(_that.title);case _SetPatternPaintColor():
return setPatternPaintColor(_that.color);case _SetCanvasBackgroundColor():
return setCanvasBackgroundColor(_that.color);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function( int canvasId)?  load,TResult? Function( int pattern)?  setactivePatternId,TResult? Function( double angle)?  rotatePattern,TResult? Function( CustomPattern pattern)?  setCustomPattern,TResult? Function( int index)?  paint,TResult? Function( int index)?  rotatePixel,TResult? Function()?  fill,TResult? Function( String title)?  save,TResult? Function( Color color)?  setPatternPaintColor,TResult? Function( Color color)?  setCanvasBackgroundColor,}) {final _that = this;
switch (_that) {
case _Init() when init != null:
return init();case _Load() when load != null:
return load(_that.canvasId);case _SetactivePatternId() when setactivePatternId != null:
return setactivePatternId(_that.pattern);case _RotatePattern() when rotatePattern != null:
return rotatePattern(_that.angle);case _SetCustomPattern() when setCustomPattern != null:
return setCustomPattern(_that.pattern);case _Paint() when paint != null:
return paint(_that.index);case _RotatePixel() when rotatePixel != null:
return rotatePixel(_that.index);case _Fill() when fill != null:
return fill();case _Save() when save != null:
return save(_that.title);case _SetPatternPaintColor() when setPatternPaintColor != null:
return setPatternPaintColor(_that.color);case _SetCanvasBackgroundColor() when setCanvasBackgroundColor != null:
return setCanvasBackgroundColor(_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _Init implements CanvasEvent {
  const _Init();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Init);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CanvasEvent.init()';
}


}




/// @nodoc


class _Load implements CanvasEvent {
  const _Load(this.canvasId);
  

 final  int canvasId;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCopyWith<_Load> get copyWith => __$LoadCopyWithImpl<_Load>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load&&(identical(other.canvasId, canvasId) || other.canvasId == canvasId));
}


@override
int get hashCode => Object.hash(runtimeType,canvasId);

@override
String toString() {
  return 'CanvasEvent.load(canvasId: $canvasId)';
}


}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) = __$LoadCopyWithImpl;
@useResult
$Res call({
 int canvasId
});




}
/// @nodoc
class __$LoadCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? canvasId = null,}) {
  return _then(_Load(
null == canvasId ? _self.canvasId : canvasId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetactivePatternId implements CanvasEvent {
  const _SetactivePatternId(this.pattern);
  

 final  int pattern;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetactivePatternIdCopyWith<_SetactivePatternId> get copyWith => __$SetactivePatternIdCopyWithImpl<_SetactivePatternId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetactivePatternId&&(identical(other.pattern, pattern) || other.pattern == pattern));
}


@override
int get hashCode => Object.hash(runtimeType,pattern);

@override
String toString() {
  return 'CanvasEvent.setactivePatternId(pattern: $pattern)';
}


}

/// @nodoc
abstract mixin class _$SetactivePatternIdCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$SetactivePatternIdCopyWith(_SetactivePatternId value, $Res Function(_SetactivePatternId) _then) = __$SetactivePatternIdCopyWithImpl;
@useResult
$Res call({
 int pattern
});




}
/// @nodoc
class __$SetactivePatternIdCopyWithImpl<$Res>
    implements _$SetactivePatternIdCopyWith<$Res> {
  __$SetactivePatternIdCopyWithImpl(this._self, this._then);

  final _SetactivePatternId _self;
  final $Res Function(_SetactivePatternId) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pattern = null,}) {
  return _then(_SetactivePatternId(
null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RotatePattern implements CanvasEvent {
  const _RotatePattern(this.angle);
  

 final  double angle;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RotatePatternCopyWith<_RotatePattern> get copyWith => __$RotatePatternCopyWithImpl<_RotatePattern>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RotatePattern&&(identical(other.angle, angle) || other.angle == angle));
}


@override
int get hashCode => Object.hash(runtimeType,angle);

@override
String toString() {
  return 'CanvasEvent.rotatePattern(angle: $angle)';
}


}

/// @nodoc
abstract mixin class _$RotatePatternCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$RotatePatternCopyWith(_RotatePattern value, $Res Function(_RotatePattern) _then) = __$RotatePatternCopyWithImpl;
@useResult
$Res call({
 double angle
});




}
/// @nodoc
class __$RotatePatternCopyWithImpl<$Res>
    implements _$RotatePatternCopyWith<$Res> {
  __$RotatePatternCopyWithImpl(this._self, this._then);

  final _RotatePattern _self;
  final $Res Function(_RotatePattern) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? angle = null,}) {
  return _then(_RotatePattern(
null == angle ? _self.angle : angle // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _SetCustomPattern implements CanvasEvent {
  const _SetCustomPattern(this.pattern);
  

 final  CustomPattern pattern;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCustomPatternCopyWith<_SetCustomPattern> get copyWith => __$SetCustomPatternCopyWithImpl<_SetCustomPattern>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCustomPattern&&(identical(other.pattern, pattern) || other.pattern == pattern));
}


@override
int get hashCode => Object.hash(runtimeType,pattern);

@override
String toString() {
  return 'CanvasEvent.setCustomPattern(pattern: $pattern)';
}


}

/// @nodoc
abstract mixin class _$SetCustomPatternCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$SetCustomPatternCopyWith(_SetCustomPattern value, $Res Function(_SetCustomPattern) _then) = __$SetCustomPatternCopyWithImpl;
@useResult
$Res call({
 CustomPattern pattern
});


$CustomPatternCopyWith<$Res> get pattern;

}
/// @nodoc
class __$SetCustomPatternCopyWithImpl<$Res>
    implements _$SetCustomPatternCopyWith<$Res> {
  __$SetCustomPatternCopyWithImpl(this._self, this._then);

  final _SetCustomPattern _self;
  final $Res Function(_SetCustomPattern) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pattern = null,}) {
  return _then(_SetCustomPattern(
null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as CustomPattern,
  ));
}

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomPatternCopyWith<$Res> get pattern {
  
  return $CustomPatternCopyWith<$Res>(_self.pattern, (value) {
    return _then(_self.copyWith(pattern: value));
  });
}
}

/// @nodoc


class _Paint implements CanvasEvent {
  const _Paint(this.index);
  

 final  int index;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaintCopyWith<_Paint> get copyWith => __$PaintCopyWithImpl<_Paint>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paint&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'CanvasEvent.paint(index: $index)';
}


}

/// @nodoc
abstract mixin class _$PaintCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$PaintCopyWith(_Paint value, $Res Function(_Paint) _then) = __$PaintCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$PaintCopyWithImpl<$Res>
    implements _$PaintCopyWith<$Res> {
  __$PaintCopyWithImpl(this._self, this._then);

  final _Paint _self;
  final $Res Function(_Paint) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_Paint(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RotatePixel implements CanvasEvent {
  const _RotatePixel(this.index);
  

 final  int index;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RotatePixelCopyWith<_RotatePixel> get copyWith => __$RotatePixelCopyWithImpl<_RotatePixel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RotatePixel&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'CanvasEvent.rotatePixel(index: $index)';
}


}

/// @nodoc
abstract mixin class _$RotatePixelCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$RotatePixelCopyWith(_RotatePixel value, $Res Function(_RotatePixel) _then) = __$RotatePixelCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class __$RotatePixelCopyWithImpl<$Res>
    implements _$RotatePixelCopyWith<$Res> {
  __$RotatePixelCopyWithImpl(this._self, this._then);

  final _RotatePixel _self;
  final $Res Function(_RotatePixel) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(_RotatePixel(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Fill implements CanvasEvent {
  const _Fill();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fill);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CanvasEvent.fill()';
}


}




/// @nodoc


class _Save implements CanvasEvent {
  const _Save(this.title);
  

 final  String title;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveCopyWith<_Save> get copyWith => __$SaveCopyWithImpl<_Save>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'CanvasEvent.save(title: $title)';
}


}

/// @nodoc
abstract mixin class _$SaveCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$SaveCopyWith(_Save value, $Res Function(_Save) _then) = __$SaveCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$SaveCopyWithImpl<$Res>
    implements _$SaveCopyWith<$Res> {
  __$SaveCopyWithImpl(this._self, this._then);

  final _Save _self;
  final $Res Function(_Save) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_Save(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SetPatternPaintColor implements CanvasEvent {
  const _SetPatternPaintColor(this.color);
  

 final  Color color;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetPatternPaintColorCopyWith<_SetPatternPaintColor> get copyWith => __$SetPatternPaintColorCopyWithImpl<_SetPatternPaintColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetPatternPaintColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'CanvasEvent.setPatternPaintColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetPatternPaintColorCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$SetPatternPaintColorCopyWith(_SetPatternPaintColor value, $Res Function(_SetPatternPaintColor) _then) = __$SetPatternPaintColorCopyWithImpl;
@useResult
$Res call({
 Color color
});




}
/// @nodoc
class __$SetPatternPaintColorCopyWithImpl<$Res>
    implements _$SetPatternPaintColorCopyWith<$Res> {
  __$SetPatternPaintColorCopyWithImpl(this._self, this._then);

  final _SetPatternPaintColor _self;
  final $Res Function(_SetPatternPaintColor) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetPatternPaintColor(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class _SetCanvasBackgroundColor implements CanvasEvent {
  const _SetCanvasBackgroundColor(this.color);
  

 final  Color color;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetCanvasBackgroundColorCopyWith<_SetCanvasBackgroundColor> get copyWith => __$SetCanvasBackgroundColorCopyWithImpl<_SetCanvasBackgroundColor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetCanvasBackgroundColor&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,color);

@override
String toString() {
  return 'CanvasEvent.setCanvasBackgroundColor(color: $color)';
}


}

/// @nodoc
abstract mixin class _$SetCanvasBackgroundColorCopyWith<$Res> implements $CanvasEventCopyWith<$Res> {
  factory _$SetCanvasBackgroundColorCopyWith(_SetCanvasBackgroundColor value, $Res Function(_SetCanvasBackgroundColor) _then) = __$SetCanvasBackgroundColorCopyWithImpl;
@useResult
$Res call({
 Color color
});




}
/// @nodoc
class __$SetCanvasBackgroundColorCopyWithImpl<$Res>
    implements _$SetCanvasBackgroundColorCopyWith<$Res> {
  __$SetCanvasBackgroundColorCopyWithImpl(this._self, this._then);

  final _SetCanvasBackgroundColor _self;
  final $Res Function(_SetCanvasBackgroundColor) _then;

/// Create a copy of CanvasEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? color = null,}) {
  return _then(_SetCanvasBackgroundColor(
null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc
mixin _$CanvasState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CanvasState()';
}


}

/// @nodoc
class $CanvasStateCopyWith<$Res>  {
$CanvasStateCopyWith(CanvasState _, $Res Function(CanvasState) __);
}


/// Adds pattern-matching-related methods to [CanvasState].
extension CanvasStatePatterns on CanvasState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Ready value)?  ready,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Ready value)  ready,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Ready():
return ready(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Ready value)?  ready,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Ready() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int width,  int height,  int insets,  int activePatternId,  double patternRotation,  CustomPattern? customPattern,  List<PixelData> pixels,  Color patternPaintColor,  Color canvasBackgroundColor)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.width,_that.height,_that.insets,_that.activePatternId,_that.patternRotation,_that.customPattern,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int width,  int height,  int insets,  int activePatternId,  double patternRotation,  CustomPattern? customPattern,  List<PixelData> pixels,  Color patternPaintColor,  Color canvasBackgroundColor)  ready,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Ready():
return ready(_that.width,_that.height,_that.insets,_that.activePatternId,_that.patternRotation,_that.customPattern,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int width,  int height,  int insets,  int activePatternId,  double patternRotation,  CustomPattern? customPattern,  List<PixelData> pixels,  Color patternPaintColor,  Color canvasBackgroundColor)?  ready,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.width,_that.height,_that.insets,_that.activePatternId,_that.patternRotation,_that.customPattern,_that.pixels,_that.patternPaintColor,_that.canvasBackgroundColor);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CanvasState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CanvasState.initial()';
}


}




/// @nodoc


class _Loading implements CanvasState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CanvasState.loading()';
}


}




/// @nodoc


class _Ready implements CanvasState {
  const _Ready({required this.width, required this.height, required this.insets, required this.activePatternId, required this.patternRotation, this.customPattern, required final  List<PixelData> pixels, required this.patternPaintColor, required this.canvasBackgroundColor}): _pixels = pixels;
  

/// Canvas width in pixels.
 final  int width;
/// Canvas height in pixels.
 final  int height;
/// Padding/insets around drawable area.
 final  int insets;
/// Currently selected painting pattern as integer index.
 final  int activePatternId;
/// Pattern rotation angle in radians.
 final  double patternRotation;
/// Custom pattern if active (null if using built-in patterns).
 final  CustomPattern? customPattern;
/// Pixel data with pattern indices and rotations in row-major order.
 final  List<PixelData> _pixels;
/// Pixel data with pattern indices and rotations in row-major order.
 List<PixelData> get pixels {
  if (_pixels is EqualUnmodifiableListView) return _pixels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pixels);
}

/// Color to use for painting patterns.
 final  Color patternPaintColor;
/// Background color for the canvas.
 final  Color canvasBackgroundColor;

/// Create a copy of CanvasState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&(identical(other.activePatternId, activePatternId) || other.activePatternId == activePatternId)&&(identical(other.patternRotation, patternRotation) || other.patternRotation == patternRotation)&&(identical(other.customPattern, customPattern) || other.customPattern == customPattern)&&const DeepCollectionEquality().equals(other._pixels, _pixels)&&(identical(other.patternPaintColor, patternPaintColor) || other.patternPaintColor == patternPaintColor)&&(identical(other.canvasBackgroundColor, canvasBackgroundColor) || other.canvasBackgroundColor == canvasBackgroundColor));
}


@override
int get hashCode => Object.hash(runtimeType,width,height,insets,activePatternId,patternRotation,customPattern,const DeepCollectionEquality().hash(_pixels),patternPaintColor,canvasBackgroundColor);

@override
String toString() {
  return 'CanvasState.ready(width: $width, height: $height, insets: $insets, activePatternId: $activePatternId, patternRotation: $patternRotation, customPattern: $customPattern, pixels: $pixels, patternPaintColor: $patternPaintColor, canvasBackgroundColor: $canvasBackgroundColor)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $CanvasStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 int width, int height, int insets, int activePatternId, double patternRotation, CustomPattern? customPattern, List<PixelData> pixels, Color patternPaintColor, Color canvasBackgroundColor
});


$CustomPatternCopyWith<$Res>? get customPattern;

}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of CanvasState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,Object? insets = null,Object? activePatternId = null,Object? patternRotation = null,Object? customPattern = freezed,Object? pixels = null,Object? patternPaintColor = null,Object? canvasBackgroundColor = null,}) {
  return _then(_Ready(
width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,insets: null == insets ? _self.insets : insets // ignore: cast_nullable_to_non_nullable
as int,activePatternId: null == activePatternId ? _self.activePatternId : activePatternId // ignore: cast_nullable_to_non_nullable
as int,patternRotation: null == patternRotation ? _self.patternRotation : patternRotation // ignore: cast_nullable_to_non_nullable
as double,customPattern: freezed == customPattern ? _self.customPattern : customPattern // ignore: cast_nullable_to_non_nullable
as CustomPattern?,pixels: null == pixels ? _self._pixels : pixels // ignore: cast_nullable_to_non_nullable
as List<PixelData>,patternPaintColor: null == patternPaintColor ? _self.patternPaintColor : patternPaintColor // ignore: cast_nullable_to_non_nullable
as Color,canvasBackgroundColor: null == canvasBackgroundColor ? _self.canvasBackgroundColor : canvasBackgroundColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

/// Create a copy of CanvasState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomPatternCopyWith<$Res>? get customPattern {
    if (_self.customPattern == null) {
    return null;
  }

  return $CustomPatternCopyWith<$Res>(_self.customPattern!, (value) {
    return _then(_self.copyWith(customPattern: value));
  });
}
}

// dart format on
