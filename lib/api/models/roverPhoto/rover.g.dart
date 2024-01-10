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
