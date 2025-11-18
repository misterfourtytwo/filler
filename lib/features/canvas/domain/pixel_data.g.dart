// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixel_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PixelData _$PixelDataFromJson(Map<String, dynamic> json) => _PixelData(
  pattern: (json['pattern'] as num).toInt(),
  rotation: (json['rotation'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PixelDataToJson(_PixelData instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
      'rotation': instance.rotation,
    };
