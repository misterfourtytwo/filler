// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CanvasesTable extends Canvases with TableInfo<$CanvasesTable, Canvase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CanvasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Untitled'),
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _insetsMeta = const VerificationMeta('insets');
  @override
  late final GeneratedColumn<int> insets = GeneratedColumn<int>(
    'insets',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pixelsJsonMeta = const VerificationMeta(
    'pixelsJson',
  );
  @override
  late final GeneratedColumn<String> pixelsJson = GeneratedColumn<String>(
    'pixels_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _patternPaintColorMeta = const VerificationMeta(
    'patternPaintColor',
  );
  @override
  late final GeneratedColumn<int> patternPaintColor = GeneratedColumn<int>(
    'pattern_paint_color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0xFF000000),
  );
  static const VerificationMeta _canvasBackgroundColorMeta =
      const VerificationMeta('canvasBackgroundColor');
  @override
  late final GeneratedColumn<int> canvasBackgroundColor = GeneratedColumn<int>(
    'canvas_background_color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0xFFFFFFFF),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    width,
    height,
    insets,
    pixelsJson,
    patternPaintColor,
    canvasBackgroundColor,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'canvases';
  @override
  VerificationContext validateIntegrity(
    Insertable<Canvase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('insets')) {
      context.handle(
        _insetsMeta,
        insets.isAcceptableOrUnknown(data['insets']!, _insetsMeta),
      );
    }
    if (data.containsKey('pixels_json')) {
      context.handle(
        _pixelsJsonMeta,
        pixelsJson.isAcceptableOrUnknown(data['pixels_json']!, _pixelsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_pixelsJsonMeta);
    }
    if (data.containsKey('pattern_paint_color')) {
      context.handle(
        _patternPaintColorMeta,
        patternPaintColor.isAcceptableOrUnknown(
          data['pattern_paint_color']!,
          _patternPaintColorMeta,
        ),
      );
    }
    if (data.containsKey('canvas_background_color')) {
      context.handle(
        _canvasBackgroundColorMeta,
        canvasBackgroundColor.isAcceptableOrUnknown(
          data['canvas_background_color']!,
          _canvasBackgroundColorMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Canvase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Canvase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      )!,
      insets: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}insets'],
      )!,
      pixelsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pixels_json'],
      )!,
      patternPaintColor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pattern_paint_color'],
      )!,
      canvasBackgroundColor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}canvas_background_color'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CanvasesTable createAlias(String alias) {
    return $CanvasesTable(attachedDatabase, alias);
  }
}

class Canvase extends DataClass implements Insertable<Canvase> {
  /// Primary key, auto-incrementing ID.
  final int id;

  /// Canvas title, defaults to 'Untitled'.
  final String title;

  /// Canvas width in pixels.
  final int width;

  /// Canvas height in pixels.
  final int height;

  /// Canvas padding/insets, defaults to 0.
  final int insets;

  /// JSON-serialized pixel data with pattern indices and rotations.
  final String pixelsJson;

  /// Color to use for painting patterns, stored as ARGB integer.
  final int patternPaintColor;

  /// Background color for the canvas, stored as ARGB integer.
  final int canvasBackgroundColor;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last update timestamp.
  final DateTime updatedAt;
  const Canvase({
    required this.id,
    required this.title,
    required this.width,
    required this.height,
    required this.insets,
    required this.pixelsJson,
    required this.patternPaintColor,
    required this.canvasBackgroundColor,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    map['insets'] = Variable<int>(insets);
    map['pixels_json'] = Variable<String>(pixelsJson);
    map['pattern_paint_color'] = Variable<int>(patternPaintColor);
    map['canvas_background_color'] = Variable<int>(canvasBackgroundColor);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CanvasesCompanion toCompanion(bool nullToAbsent) {
    return CanvasesCompanion(
      id: Value(id),
      title: Value(title),
      width: Value(width),
      height: Value(height),
      insets: Value(insets),
      pixelsJson: Value(pixelsJson),
      patternPaintColor: Value(patternPaintColor),
      canvasBackgroundColor: Value(canvasBackgroundColor),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Canvase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Canvase(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      insets: serializer.fromJson<int>(json['insets']),
      pixelsJson: serializer.fromJson<String>(json['pixelsJson']),
      patternPaintColor: serializer.fromJson<int>(json['patternPaintColor']),
      canvasBackgroundColor: serializer.fromJson<int>(
        json['canvasBackgroundColor'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'insets': serializer.toJson<int>(insets),
      'pixelsJson': serializer.toJson<String>(pixelsJson),
      'patternPaintColor': serializer.toJson<int>(patternPaintColor),
      'canvasBackgroundColor': serializer.toJson<int>(canvasBackgroundColor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Canvase copyWith({
    int? id,
    String? title,
    int? width,
    int? height,
    int? insets,
    String? pixelsJson,
    int? patternPaintColor,
    int? canvasBackgroundColor,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Canvase(
    id: id ?? this.id,
    title: title ?? this.title,
    width: width ?? this.width,
    height: height ?? this.height,
    insets: insets ?? this.insets,
    pixelsJson: pixelsJson ?? this.pixelsJson,
    patternPaintColor: patternPaintColor ?? this.patternPaintColor,
    canvasBackgroundColor: canvasBackgroundColor ?? this.canvasBackgroundColor,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Canvase copyWithCompanion(CanvasesCompanion data) {
    return Canvase(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      insets: data.insets.present ? data.insets.value : this.insets,
      pixelsJson: data.pixelsJson.present
          ? data.pixelsJson.value
          : this.pixelsJson,
      patternPaintColor: data.patternPaintColor.present
          ? data.patternPaintColor.value
          : this.patternPaintColor,
      canvasBackgroundColor: data.canvasBackgroundColor.present
          ? data.canvasBackgroundColor.value
          : this.canvasBackgroundColor,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Canvase(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('insets: $insets, ')
          ..write('pixelsJson: $pixelsJson, ')
          ..write('patternPaintColor: $patternPaintColor, ')
          ..write('canvasBackgroundColor: $canvasBackgroundColor, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    width,
    height,
    insets,
    pixelsJson,
    patternPaintColor,
    canvasBackgroundColor,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Canvase &&
          other.id == this.id &&
          other.title == this.title &&
          other.width == this.width &&
          other.height == this.height &&
          other.insets == this.insets &&
          other.pixelsJson == this.pixelsJson &&
          other.patternPaintColor == this.patternPaintColor &&
          other.canvasBackgroundColor == this.canvasBackgroundColor &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CanvasesCompanion extends UpdateCompanion<Canvase> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> width;
  final Value<int> height;
  final Value<int> insets;
  final Value<String> pixelsJson;
  final Value<int> patternPaintColor;
  final Value<int> canvasBackgroundColor;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CanvasesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.insets = const Value.absent(),
    this.pixelsJson = const Value.absent(),
    this.patternPaintColor = const Value.absent(),
    this.canvasBackgroundColor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CanvasesCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    required int width,
    required int height,
    this.insets = const Value.absent(),
    required String pixelsJson,
    this.patternPaintColor = const Value.absent(),
    this.canvasBackgroundColor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : width = Value(width),
       height = Value(height),
       pixelsJson = Value(pixelsJson);
  static Insertable<Canvase> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? insets,
    Expression<String>? pixelsJson,
    Expression<int>? patternPaintColor,
    Expression<int>? canvasBackgroundColor,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (insets != null) 'insets': insets,
      if (pixelsJson != null) 'pixels_json': pixelsJson,
      if (patternPaintColor != null) 'pattern_paint_color': patternPaintColor,
      if (canvasBackgroundColor != null)
        'canvas_background_color': canvasBackgroundColor,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CanvasesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<int>? width,
    Value<int>? height,
    Value<int>? insets,
    Value<String>? pixelsJson,
    Value<int>? patternPaintColor,
    Value<int>? canvasBackgroundColor,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CanvasesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      width: width ?? this.width,
      height: height ?? this.height,
      insets: insets ?? this.insets,
      pixelsJson: pixelsJson ?? this.pixelsJson,
      patternPaintColor: patternPaintColor ?? this.patternPaintColor,
      canvasBackgroundColor:
          canvasBackgroundColor ?? this.canvasBackgroundColor,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (insets.present) {
      map['insets'] = Variable<int>(insets.value);
    }
    if (pixelsJson.present) {
      map['pixels_json'] = Variable<String>(pixelsJson.value);
    }
    if (patternPaintColor.present) {
      map['pattern_paint_color'] = Variable<int>(patternPaintColor.value);
    }
    if (canvasBackgroundColor.present) {
      map['canvas_background_color'] = Variable<int>(
        canvasBackgroundColor.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CanvasesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('insets: $insets, ')
          ..write('pixelsJson: $pixelsJson, ')
          ..write('patternPaintColor: $patternPaintColor, ')
          ..write('canvasBackgroundColor: $canvasBackgroundColor, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PreferenceKeyValuesTable extends PreferenceKeyValues
    with TableInfo<$PreferenceKeyValuesTable, PreferenceKeyValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferenceKeyValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueTypeMeta = const VerificationMeta(
    'valueType',
  );
  @override
  late final GeneratedColumn<String> valueType = GeneratedColumn<String>(
    'value_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('string'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    value,
    valueType,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preference_key_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreferenceKeyValue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('value_type')) {
      context.handle(
        _valueTypeMeta,
        valueType.isAcceptableOrUnknown(data['value_type']!, _valueTypeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  PreferenceKeyValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreferenceKeyValue(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      valueType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_type'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PreferenceKeyValuesTable createAlias(String alias) {
    return $PreferenceKeyValuesTable(attachedDatabase, alias);
  }
}

class PreferenceKeyValue extends DataClass
    implements Insertable<PreferenceKeyValue> {
  /// Preference key (e.g., 'width', 'height', 'insets', 'defaultColor').
  final String key;

  /// Preference value stored as string (parsed based on key type).
  final String value;

  /// Preference value type for proper parsing ('int', 'string', 'bool').
  final String valueType;

  /// Creation timestamp.
  final DateTime createdAt;

  /// Last update timestamp.
  final DateTime updatedAt;
  const PreferenceKeyValue({
    required this.key,
    required this.value,
    required this.valueType,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['value_type'] = Variable<String>(valueType);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PreferenceKeyValuesCompanion toCompanion(bool nullToAbsent) {
    return PreferenceKeyValuesCompanion(
      key: Value(key),
      value: Value(value),
      valueType: Value(valueType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PreferenceKeyValue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreferenceKeyValue(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      valueType: serializer.fromJson<String>(json['valueType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'valueType': serializer.toJson<String>(valueType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PreferenceKeyValue copyWith({
    String? key,
    String? value,
    String? valueType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PreferenceKeyValue(
    key: key ?? this.key,
    value: value ?? this.value,
    valueType: valueType ?? this.valueType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PreferenceKeyValue copyWithCompanion(PreferenceKeyValuesCompanion data) {
    return PreferenceKeyValue(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      valueType: data.valueType.present ? data.valueType.value : this.valueType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceKeyValue(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, valueType, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreferenceKeyValue &&
          other.key == this.key &&
          other.value == this.value &&
          other.valueType == this.valueType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PreferenceKeyValuesCompanion extends UpdateCompanion<PreferenceKeyValue> {
  final Value<String> key;
  final Value<String> value;
  final Value<String> valueType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PreferenceKeyValuesCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.valueType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferenceKeyValuesCompanion.insert({
    required String key,
    required String value,
    this.valueType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<PreferenceKeyValue> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? valueType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (valueType != null) 'value_type': valueType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferenceKeyValuesCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<String>? valueType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PreferenceKeyValuesCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      valueType: valueType ?? this.valueType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (valueType.present) {
      map['value_type'] = Variable<String>(valueType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceKeyValuesCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CanvasesTable canvases = $CanvasesTable(this);
  late final $PreferenceKeyValuesTable preferenceKeyValues =
      $PreferenceKeyValuesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    canvases,
    preferenceKeyValues,
  ];
}

typedef $$CanvasesTableCreateCompanionBuilder =
    CanvasesCompanion Function({
      Value<int> id,
      Value<String> title,
      required int width,
      required int height,
      Value<int> insets,
      required String pixelsJson,
      Value<int> patternPaintColor,
      Value<int> canvasBackgroundColor,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$CanvasesTableUpdateCompanionBuilder =
    CanvasesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<int> width,
      Value<int> height,
      Value<int> insets,
      Value<String> pixelsJson,
      Value<int> patternPaintColor,
      Value<int> canvasBackgroundColor,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$CanvasesTableFilterComposer
    extends Composer<_$AppDatabase, $CanvasesTable> {
  $$CanvasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get insets => $composableBuilder(
    column: $table.insets,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pixelsJson => $composableBuilder(
    column: $table.pixelsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get patternPaintColor => $composableBuilder(
    column: $table.patternPaintColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get canvasBackgroundColor => $composableBuilder(
    column: $table.canvasBackgroundColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CanvasesTableOrderingComposer
    extends Composer<_$AppDatabase, $CanvasesTable> {
  $$CanvasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get insets => $composableBuilder(
    column: $table.insets,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pixelsJson => $composableBuilder(
    column: $table.pixelsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get patternPaintColor => $composableBuilder(
    column: $table.patternPaintColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get canvasBackgroundColor => $composableBuilder(
    column: $table.canvasBackgroundColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CanvasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CanvasesTable> {
  $$CanvasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get insets =>
      $composableBuilder(column: $table.insets, builder: (column) => column);

  GeneratedColumn<String> get pixelsJson => $composableBuilder(
    column: $table.pixelsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get patternPaintColor => $composableBuilder(
    column: $table.patternPaintColor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get canvasBackgroundColor => $composableBuilder(
    column: $table.canvasBackgroundColor,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CanvasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CanvasesTable,
          Canvase,
          $$CanvasesTableFilterComposer,
          $$CanvasesTableOrderingComposer,
          $$CanvasesTableAnnotationComposer,
          $$CanvasesTableCreateCompanionBuilder,
          $$CanvasesTableUpdateCompanionBuilder,
          (Canvase, BaseReferences<_$AppDatabase, $CanvasesTable, Canvase>),
          Canvase,
          PrefetchHooks Function()
        > {
  $$CanvasesTableTableManager(_$AppDatabase db, $CanvasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CanvasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CanvasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CanvasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> width = const Value.absent(),
                Value<int> height = const Value.absent(),
                Value<int> insets = const Value.absent(),
                Value<String> pixelsJson = const Value.absent(),
                Value<int> patternPaintColor = const Value.absent(),
                Value<int> canvasBackgroundColor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CanvasesCompanion(
                id: id,
                title: title,
                width: width,
                height: height,
                insets: insets,
                pixelsJson: pixelsJson,
                patternPaintColor: patternPaintColor,
                canvasBackgroundColor: canvasBackgroundColor,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                required int width,
                required int height,
                Value<int> insets = const Value.absent(),
                required String pixelsJson,
                Value<int> patternPaintColor = const Value.absent(),
                Value<int> canvasBackgroundColor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CanvasesCompanion.insert(
                id: id,
                title: title,
                width: width,
                height: height,
                insets: insets,
                pixelsJson: pixelsJson,
                patternPaintColor: patternPaintColor,
                canvasBackgroundColor: canvasBackgroundColor,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CanvasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CanvasesTable,
      Canvase,
      $$CanvasesTableFilterComposer,
      $$CanvasesTableOrderingComposer,
      $$CanvasesTableAnnotationComposer,
      $$CanvasesTableCreateCompanionBuilder,
      $$CanvasesTableUpdateCompanionBuilder,
      (Canvase, BaseReferences<_$AppDatabase, $CanvasesTable, Canvase>),
      Canvase,
      PrefetchHooks Function()
    >;
typedef $$PreferenceKeyValuesTableCreateCompanionBuilder =
    PreferenceKeyValuesCompanion Function({
      required String key,
      required String value,
      Value<String> valueType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$PreferenceKeyValuesTableUpdateCompanionBuilder =
    PreferenceKeyValuesCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<String> valueType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PreferenceKeyValuesTableFilterComposer
    extends Composer<_$AppDatabase, $PreferenceKeyValuesTable> {
  $$PreferenceKeyValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PreferenceKeyValuesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferenceKeyValuesTable> {
  $$PreferenceKeyValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreferenceKeyValuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferenceKeyValuesTable> {
  $$PreferenceKeyValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get valueType =>
      $composableBuilder(column: $table.valueType, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PreferenceKeyValuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreferenceKeyValuesTable,
          PreferenceKeyValue,
          $$PreferenceKeyValuesTableFilterComposer,
          $$PreferenceKeyValuesTableOrderingComposer,
          $$PreferenceKeyValuesTableAnnotationComposer,
          $$PreferenceKeyValuesTableCreateCompanionBuilder,
          $$PreferenceKeyValuesTableUpdateCompanionBuilder,
          (
            PreferenceKeyValue,
            BaseReferences<
              _$AppDatabase,
              $PreferenceKeyValuesTable,
              PreferenceKeyValue
            >,
          ),
          PreferenceKeyValue,
          PrefetchHooks Function()
        > {
  $$PreferenceKeyValuesTableTableManager(
    _$AppDatabase db,
    $PreferenceKeyValuesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferenceKeyValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferenceKeyValuesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PreferenceKeyValuesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<String> valueType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferenceKeyValuesCompanion(
                key: key,
                value: value,
                valueType: valueType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<String> valueType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PreferenceKeyValuesCompanion.insert(
                key: key,
                value: value,
                valueType: valueType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreferenceKeyValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreferenceKeyValuesTable,
      PreferenceKeyValue,
      $$PreferenceKeyValuesTableFilterComposer,
      $$PreferenceKeyValuesTableOrderingComposer,
      $$PreferenceKeyValuesTableAnnotationComposer,
      $$PreferenceKeyValuesTableCreateCompanionBuilder,
      $$PreferenceKeyValuesTableUpdateCompanionBuilder,
      (
        PreferenceKeyValue,
        BaseReferences<
          _$AppDatabase,
          $PreferenceKeyValuesTable,
          PreferenceKeyValue
        >,
      ),
      PreferenceKeyValue,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CanvasesTableTableManager get canvases =>
      $$CanvasesTableTableManager(_db, _db.canvases);
  $$PreferenceKeyValuesTableTableManager get preferenceKeyValues =>
      $$PreferenceKeyValuesTableTableManager(_db, _db.preferenceKeyValues);
}
