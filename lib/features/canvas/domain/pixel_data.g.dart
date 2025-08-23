// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixel_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixelDataImpl _$$PixelDataImplFromJson(Map<String, dynamic> json) =>
    _$PixelDataImpl(
      pattern: (json['pattern'] as num).toInt(),
      rotation: (json['rotation'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$PixelDataImplToJson(_$PixelDataImpl instance) =>
    <String, dynamic>{
      'pattern': instance.pattern,
      'rotation': instance.rotation,
    };
