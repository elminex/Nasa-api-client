// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quaternions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quaternions _$QuaternionsFromJson(Map<String, dynamic> json) => Quaternions(
      q1: (json['q1'] as num).toDouble(),
      q2: (json['q2'] as num).toDouble(),
      q3: (json['q3'] as num).toDouble(),
      q0: (json['q0'] as num).toDouble(),
    );

Map<String, dynamic> _$QuaternionsToJson(Quaternions instance) =>
    <String, dynamic>{
      'q0': instance.q0,
      'q1': instance.q1,
      'q2': instance.q2,
      'q3': instance.q3,
    };
