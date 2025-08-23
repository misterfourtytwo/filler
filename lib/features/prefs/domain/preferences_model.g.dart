// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferencesModelImpl _$$PreferencesModelImplFromJson(
  Map<String, dynamic> json,
) => _$PreferencesModelImpl(
  width: (json['width'] as num).toInt(),
  height: (json['height'] as num).toInt(),
  insets: (json['insets'] as num).toInt(),
  defaultPattern: (json['defaultPattern'] as num).toInt(),
  themeMode: (json['themeMode'] as num?)?.toInt() ?? 2,
);

Map<String, dynamic> _$$PreferencesModelImplToJson(
  _$PreferencesModelImpl instance,
) => <String, dynamic>{
  'width': instance.width,
  'height': instance.height,
  'insets': instance.insets,
  'defaultPattern': instance.defaultPattern,
  'themeMode': instance.themeMode,
};
