// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_camera.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoverCamera _$RoverCameraFromJson(Map<String, dynamic> json) => RoverCamera(
      id: json['id'] as int?,
      name: json['name'] as String,
      rover_id: json['rover_id'] as int?,
      full_name: json['full_name'] as String,
    );

Map<String, dynamic> _$RoverCameraToJson(RoverCamera instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rover_id': instance.rover_id,
      'full_name': instance.full_name,
    };
