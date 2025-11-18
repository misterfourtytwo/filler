// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreferencesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesEvent()';
}


}

/// @nodoc
class $PreferencesEventCopyWith<$Res>  {
$PreferencesEventCopyWith(PreferencesEvent _, $Res Function(PreferencesEvent) __);
}


/// Adds pattern-matching-related methods to [PreferencesEvent].
extension PreferencesEventPatterns on PreferencesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Load value)?  load,TResult Function( _SetWidth value)?  setWidth,TResult Function( _SetHeight value)?  setHeight,TResult Function( _SetInsets value)?  setInsets,TResult Function( _SetPattern value)?  setPattern,TResult Function( _SetThemeMode value)?  setThemeMode,TResult Function( _Save value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _SetWidth() when setWidth != null:
return setWidth(_that);case _SetHeight() when setHeight != null:
return setHeight(_that);case _SetInsets() when setInsets != null:
return setInsets(_that);case _SetPattern() when setPattern != null:
return setPattern(_that);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that);case _Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Load value)  load,required TResult Function( _SetWidth value)  setWidth,required TResult Function( _SetHeight value)  setHeight,required TResult Function( _SetInsets value)  setInsets,required TResult Function( _SetPattern value)  setPattern,required TResult Function( _SetThemeMode value)  setThemeMode,required TResult Function( _Save value)  save,}){
final _that = this;
switch (_that) {
case _Load():
return load(_that);case _SetWidth():
return setWidth(_that);case _SetHeight():
return setHeight(_that);case _SetInsets():
return setInsets(_that);case _SetPattern():
return setPattern(_that);case _SetThemeMode():
return setThemeMode(_that);case _Save():
return save(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Load value)?  load,TResult? Function( _SetWidth value)?  setWidth,TResult? Function( _SetHeight value)?  setHeight,TResult? Function( _SetInsets value)?  setInsets,TResult? Function( _SetPattern value)?  setPattern,TResult? Function( _SetThemeMode value)?  setThemeMode,TResult? Function( _Save value)?  save,}){
final _that = this;
switch (_that) {
case _Load() when load != null:
return load(_that);case _SetWidth() when setWidth != null:
return setWidth(_that);case _SetHeight() when setHeight != null:
return setHeight(_that);case _SetInsets() when setInsets != null:
return setInsets(_that);case _SetPattern() when setPattern != null:
return setPattern(_that);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that);case _Save() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  load,TResult Function( int value)?  setWidth,TResult Function( int value)?  setHeight,TResult Function( int value)?  setInsets,TResult Function( int value)?  setPattern,TResult Function( int value)?  setThemeMode,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _SetWidth() when setWidth != null:
return setWidth(_that.value);case _SetHeight() when setHeight != null:
return setHeight(_that.value);case _SetInsets() when setInsets != null:
return setInsets(_that.value);case _SetPattern() when setPattern != null:
return setPattern(_that.value);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that.value);case _Save() when save != null:
return save();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  load,required TResult Function( int value)  setWidth,required TResult Function( int value)  setHeight,required TResult Function( int value)  setInsets,required TResult Function( int value)  setPattern,required TResult Function( int value)  setThemeMode,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case _Load():
return load();case _SetWidth():
return setWidth(_that.value);case _SetHeight():
return setHeight(_that.value);case _SetInsets():
return setInsets(_that.value);case _SetPattern():
return setPattern(_that.value);case _SetThemeMode():
return setThemeMode(_that.value);case _Save():
return save();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  load,TResult? Function( int value)?  setWidth,TResult? Function( int value)?  setHeight,TResult? Function( int value)?  setInsets,TResult? Function( int value)?  setPattern,TResult? Function( int value)?  setThemeMode,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case _Load() when load != null:
return load();case _SetWidth() when setWidth != null:
return setWidth(_that.value);case _SetHeight() when setHeight != null:
return setHeight(_that.value);case _SetInsets() when setInsets != null:
return setInsets(_that.value);case _SetPattern() when setPattern != null:
return setPattern(_that.value);case _SetThemeMode() when setThemeMode != null:
return setThemeMode(_that.value);case _Save() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class _Load implements PreferencesEvent {
  const _Load();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Load);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesEvent.load()';
}


}




/// @nodoc


class _SetWidth implements PreferencesEvent {
  const _SetWidth(this.value);
  

 final  int value;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetWidthCopyWith<_SetWidth> get copyWith => __$SetWidthCopyWithImpl<_SetWidth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetWidth&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreferencesEvent.setWidth(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetWidthCopyWith<$Res> implements $PreferencesEventCopyWith<$Res> {
  factory _$SetWidthCopyWith(_SetWidth value, $Res Function(_SetWidth) _then) = __$SetWidthCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class __$SetWidthCopyWithImpl<$Res>
    implements _$SetWidthCopyWith<$Res> {
  __$SetWidthCopyWithImpl(this._self, this._then);

  final _SetWidth _self;
  final $Res Function(_SetWidth) _then;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_SetWidth(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetHeight implements PreferencesEvent {
  const _SetHeight(this.value);
  

 final  int value;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetHeightCopyWith<_SetHeight> get copyWith => __$SetHeightCopyWithImpl<_SetHeight>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetHeight&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreferencesEvent.setHeight(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetHeightCopyWith<$Res> implements $PreferencesEventCopyWith<$Res> {
  factory _$SetHeightCopyWith(_SetHeight value, $Res Function(_SetHeight) _then) = __$SetHeightCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class __$SetHeightCopyWithImpl<$Res>
    implements _$SetHeightCopyWith<$Res> {
  __$SetHeightCopyWithImpl(this._self, this._then);

  final _SetHeight _self;
  final $Res Function(_SetHeight) _then;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_SetHeight(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetInsets implements PreferencesEvent {
  const _SetInsets(this.value);
  

 final  int value;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetInsetsCopyWith<_SetInsets> get copyWith => __$SetInsetsCopyWithImpl<_SetInsets>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetInsets&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreferencesEvent.setInsets(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetInsetsCopyWith<$Res> implements $PreferencesEventCopyWith<$Res> {
  factory _$SetInsetsCopyWith(_SetInsets value, $Res Function(_SetInsets) _then) = __$SetInsetsCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class __$SetInsetsCopyWithImpl<$Res>
    implements _$SetInsetsCopyWith<$Res> {
  __$SetInsetsCopyWithImpl(this._self, this._then);

  final _SetInsets _self;
  final $Res Function(_SetInsets) _then;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_SetInsets(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetPattern implements PreferencesEvent {
  const _SetPattern(this.value);
  

 final  int value;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetPatternCopyWith<_SetPattern> get copyWith => __$SetPatternCopyWithImpl<_SetPattern>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetPattern&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreferencesEvent.setPattern(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetPatternCopyWith<$Res> implements $PreferencesEventCopyWith<$Res> {
  factory _$SetPatternCopyWith(_SetPattern value, $Res Function(_SetPattern) _then) = __$SetPatternCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class __$SetPatternCopyWithImpl<$Res>
    implements _$SetPatternCopyWith<$Res> {
  __$SetPatternCopyWithImpl(this._self, this._then);

  final _SetPattern _self;
  final $Res Function(_SetPattern) _then;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_SetPattern(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetThemeMode implements PreferencesEvent {
  const _SetThemeMode(this.value);
  

 final  int value;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetThemeModeCopyWith<_SetThemeMode> get copyWith => __$SetThemeModeCopyWithImpl<_SetThemeMode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetThemeMode&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'PreferencesEvent.setThemeMode(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SetThemeModeCopyWith<$Res> implements $PreferencesEventCopyWith<$Res> {
  factory _$SetThemeModeCopyWith(_SetThemeMode value, $Res Function(_SetThemeMode) _then) = __$SetThemeModeCopyWithImpl;
@useResult
$Res call({
 int value
});




}
/// @nodoc
class __$SetThemeModeCopyWithImpl<$Res>
    implements _$SetThemeModeCopyWith<$Res> {
  __$SetThemeModeCopyWithImpl(this._self, this._then);

  final _SetThemeMode _self;
  final $Res Function(_SetThemeMode) _then;

/// Create a copy of PreferencesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_SetThemeMode(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Save implements PreferencesEvent {
  const _Save();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Save);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesEvent.save()';
}


}




/// @nodoc
mixin _$PreferencesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState()';
}


}

/// @nodoc
class $PreferencesStateCopyWith<$Res>  {
$PreferencesStateCopyWith(PreferencesState _, $Res Function(PreferencesState) __);
}


/// Adds pattern-matching-related methods to [PreferencesState].
extension PreferencesStatePatterns on PreferencesState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( int width,  int height,  int insets,  int defaultPattern,  int themeMode)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.width,_that.height,_that.insets,_that.defaultPattern,_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( int width,  int height,  int insets,  int defaultPattern,  int themeMode)  ready,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Ready():
return ready(_that.width,_that.height,_that.insets,_that.defaultPattern,_that.themeMode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( int width,  int height,  int insets,  int defaultPattern,  int themeMode)?  ready,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Ready() when ready != null:
return ready(_that.width,_that.height,_that.insets,_that.defaultPattern,_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PreferencesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState.initial()';
}


}




/// @nodoc


class _Loading implements PreferencesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PreferencesState.loading()';
}


}




/// @nodoc


class _Ready implements PreferencesState {
  const _Ready({required this.width, required this.height, required this.insets, required this.defaultPattern, required this.themeMode});
  

/// Default canvas width for new canvases.
 final  int width;
/// Default canvas height for new canvases.
 final  int height;
/// Default canvas insets/padding.
 final  int insets;
/// Default painting pattern as integer index.
 final  int defaultPattern;
/// Theme mode preference (0=light, 1=dark, 2=system).
 final  int themeMode;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadyCopyWith<_Ready> get copyWith => __$ReadyCopyWithImpl<_Ready>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ready&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.insets, insets) || other.insets == insets)&&(identical(other.defaultPattern, defaultPattern) || other.defaultPattern == defaultPattern)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,width,height,insets,defaultPattern,themeMode);

@override
String toString() {
  return 'PreferencesState.ready(width: $width, height: $height, insets: $insets, defaultPattern: $defaultPattern, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$ReadyCopyWith<$Res> implements $PreferencesStateCopyWith<$Res> {
  factory _$ReadyCopyWith(_Ready value, $Res Function(_Ready) _then) = __$ReadyCopyWithImpl;
@useResult
$Res call({
 int width, int height, int insets, int defaultPattern, int themeMode
});




}
/// @nodoc
class __$ReadyCopyWithImpl<$Res>
    implements _$ReadyCopyWith<$Res> {
  __$ReadyCopyWithImpl(this._self, this._then);

  final _Ready _self;
  final $Res Function(_Ready) _then;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? width = null,Object? height = null,Object? insets = null,Object? defaultPattern = null,Object? themeMode = null,}) {
  return _then(_Ready(
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
