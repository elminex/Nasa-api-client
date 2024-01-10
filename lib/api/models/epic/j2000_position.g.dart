// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'j2000_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

J2000Position _$J2000PositionFromJson(Map<String, dynamic> json) =>
    J2000Position(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
    );

Map<String, dynamic> _$J2000PositionToJson(J2000Position instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
    };
