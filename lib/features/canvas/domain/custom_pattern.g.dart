// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_pattern.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomPattern _$CustomPatternFromJson(Map<String, dynamic> json) =>
    _CustomPattern(
      id: json['id'] as String,
      name: json['name'] as String,
      gridSize: (json['gridSize'] as num).toInt(),
      grid: (json['grid'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CustomPatternToJson(_CustomPattern instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gridSize': instance.gridSize,
      'grid': instance.grid,
      'createdAt': instance.createdAt.toIso8601String(),
    };
