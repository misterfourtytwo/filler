// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_pattern.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomPatternImpl _$$CustomPatternImplFromJson(Map<String, dynamic> json) =>
    _$CustomPatternImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      gridSize: (json['gridSize'] as num).toInt(),
      grid: (json['grid'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CustomPatternImplToJson(_$CustomPatternImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gridSize': instance.gridSize,
      'grid': instance.grid,
      'createdAt': instance.createdAt.toIso8601String(),
    };
