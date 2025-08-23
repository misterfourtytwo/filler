// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CanvasModel {
  /// Unique identifier for the canvas.
  int get id => throw _privateConstructorUsedError;

  /// Display name for the canvas.
  String get title => throw _privateConstructorUsedError;

  /// Canvas width in pixels.
  int get width => throw _privateConstructorUsedError;

  /// Canvas height in pixels.
  int get height => throw _privateConstructorUsedError;

  /// Padding/insets around the drawable area.
  int get insets => throw _privateConstructorUsedError;

  /// Pixel data with pattern indices and rotations in row-major order.
  List<PixelData> get pixels => throw _privateConstructorUsedError;

  /// Color to use for painting patterns.
  @ColorConverter()
  Color get patternPaintColor => throw _privateConstructorUsedError;

  /// Background color for the canvas.
  @ColorConverter()
  Color get canvasBackgroundColor => throw _privateConstructorUsedError;

  /// Creation timestamp.
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Last update timestamp.
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of CanvasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CanvasModelCopyWith<CanvasModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CanvasModelCopyWith<$Res> {
  factory $CanvasModelCopyWith(
    CanvasModel value,
    $Res Function(CanvasModel) then,
  ) = _$CanvasModelCopyWithImpl<$Res, CanvasModel>;
  @useResult
  $Res call({
    int id,
    String title,
    int width,
    int height,
    int insets,
    List<PixelData> pixels,
    @ColorConverter() Color patternPaintColor,
    @ColorConverter() Color canvasBackgroundColor,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$CanvasModelCopyWithImpl<$Res, $Val extends CanvasModel>
    implements $CanvasModelCopyWith<$Res> {
  _$CanvasModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CanvasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? width = null,
    Object? height = null,
    Object? insets = null,
    Object? pixels = null,
    Object? patternPaintColor = null,
    Object? canvasBackgroundColor = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
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
            pixels: null == pixels
                ? _value.pixels
                : pixels // ignore: cast_nullable_to_non_nullable
                      as List<PixelData>,
            patternPaintColor: null == patternPaintColor
                ? _value.patternPaintColor
                : patternPaintColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            canvasBackgroundColor: null == canvasBackgroundColor
                ? _value.canvasBackgroundColor
                : canvasBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CanvasModelImplCopyWith<$Res>
    implements $CanvasModelCopyWith<$Res> {
  factory _$$CanvasModelImplCopyWith(
    _$CanvasModelImpl value,
    $Res Function(_$CanvasModelImpl) then,
  ) = __$$CanvasModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    int width,
    int height,
    int insets,
    List<PixelData> pixels,
    @ColorConverter() Color patternPaintColor,
    @ColorConverter() Color canvasBackgroundColor,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$CanvasModelImplCopyWithImpl<$Res>
    extends _$CanvasModelCopyWithImpl<$Res, _$CanvasModelImpl>
    implements _$$CanvasModelImplCopyWith<$Res> {
  __$$CanvasModelImplCopyWithImpl(
    _$CanvasModelImpl _value,
    $Res Function(_$CanvasModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CanvasModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? width = null,
    Object? height = null,
    Object? insets = null,
    Object? pixels = null,
    Object? patternPaintColor = null,
    Object? canvasBackgroundColor = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$CanvasModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
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
        pixels: null == pixels
            ? _value._pixels
            : pixels // ignore: cast_nullable_to_non_nullable
                  as List<PixelData>,
        patternPaintColor: null == patternPaintColor
            ? _value.patternPaintColor
            : patternPaintColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        canvasBackgroundColor: null == canvasBackgroundColor
            ? _value.canvasBackgroundColor
            : canvasBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$CanvasModelImpl implements _CanvasModel {
  const _$CanvasModelImpl({
    required this.id,
    required this.title,
    required this.width,
    required this.height,
    required this.insets,
    required final List<PixelData> pixels,
    @ColorConverter() required this.patternPaintColor,
    @ColorConverter() required this.canvasBackgroundColor,
    required this.createdAt,
    required this.updatedAt,
  }) : _pixels = pixels;

  /// Unique identifier for the canvas.
  @override
  final int id;

  /// Display name for the canvas.
  @override
  final String title;

  /// Canvas width in pixels.
  @override
  final int width;

  /// Canvas height in pixels.
  @override
  final int height;

  /// Padding/insets around the drawable area.
  @override
  final int insets;

  /// Pixel data with pattern indices and rotations in row-major order.
  final List<PixelData> _pixels;

  /// Pixel data with pattern indices and rotations in row-major order.
  @override
  List<PixelData> get pixels {
    if (_pixels is EqualUnmodifiableListView) return _pixels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pixels);
  }

  /// Color to use for painting patterns.
  @override
  @ColorConverter()
  final Color patternPaintColor;

  /// Background color for the canvas.
  @override
  @ColorConverter()
  final Color canvasBackgroundColor;

  /// Creation timestamp.
  @override
  final DateTime createdAt;

  /// Last update timestamp.
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CanvasModel(id: $id, title: $title, width: $width, height: $height, insets: $insets, pixels: $pixels, patternPaintColor: $patternPaintColor, canvasBackgroundColor: $canvasBackgroundColor, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CanvasModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.insets, insets) || other.insets == insets) &&
            const DeepCollectionEquality().equals(other._pixels, _pixels) &&
            (identical(other.patternPaintColor, patternPaintColor) ||
                other.patternPaintColor == patternPaintColor) &&
            (identical(other.canvasBackgroundColor, canvasBackgroundColor) ||
                other.canvasBackgroundColor == canvasBackgroundColor) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    width,
    height,
    insets,
    const DeepCollectionEquality().hash(_pixels),
    patternPaintColor,
    canvasBackgroundColor,
    createdAt,
    updatedAt,
  );

  /// Create a copy of CanvasModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CanvasModelImplCopyWith<_$CanvasModelImpl> get copyWith =>
      __$$CanvasModelImplCopyWithImpl<_$CanvasModelImpl>(this, _$identity);
}

abstract class _CanvasModel implements CanvasModel {
  const factory _CanvasModel({
    required final int id,
    required final String title,
    required final int width,
    required final int height,
    required final int insets,
    required final List<PixelData> pixels,
    @ColorConverter() required final Color patternPaintColor,
    @ColorConverter() required final Color canvasBackgroundColor,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$CanvasModelImpl;

  /// Unique identifier for the canvas.
  @override
  int get id;

  /// Display name for the canvas.
  @override
  String get title;

  /// Canvas width in pixels.
  @override
  int get width;

  /// Canvas height in pixels.
  @override
  int get height;

  /// Padding/insets around the drawable area.
  @override
  int get insets;

  /// Pixel data with pattern indices and rotations in row-major order.
  @override
  List<PixelData> get pixels;

  /// Color to use for painting patterns.
  @override
  @ColorConverter()
  Color get patternPaintColor;

  /// Background color for the canvas.
  @override
  @ColorConverter()
  Color get canvasBackgroundColor;

  /// Creation timestamp.
  @override
  DateTime get createdAt;

  /// Last update timestamp.
  @override
  DateTime get updatedAt;

  /// Create a copy of CanvasModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CanvasModelImplCopyWith<_$CanvasModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
