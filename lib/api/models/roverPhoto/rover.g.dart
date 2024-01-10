// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rover _$RoverFromJson(Map<String, dynamic> json) => Rover(
      id: json['id'] as int,
      name: json['name'] as String,
      landing_date: DateTime.parse(json['landing_date'] as String),
      launch_date: DateTime.parse(json['launch_date'] as String),
      status: json['status'] as String,
      max_sol: json['max_sol'] as int,
      max_date: DateTime.parse(json['max_date'] as String),
      total_photos: json['total_photos'] as int,
      cameras: (json['cameras'] as List<dynamic>)
          .map((e) => RoverCamera.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoverToJson(Rover instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'landing_date': instance.landing_date.toIso8601String(),
      'launch_date': instance.launch_date.toIso8601String(),
      'status': instance.status,
      'max_sol': instance.max_sol,
      'max_date': instance.max_date.toIso8601String(),
      'total_photos': instance.total_photos,
      'cameras': instance.cameras,
    };
