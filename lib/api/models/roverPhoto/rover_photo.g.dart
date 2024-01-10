// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rover_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoverPhoto _$RoverPhotoFromJson(Map<String, dynamic> json) => RoverPhoto(
      id: json['id'] as int,
      sol: json['sol'] as int,
      camera: RoverCamera.fromJson(json['camera'] as Map<String, dynamic>),
      img_src: json['img_src'] as String,
      earth_date: DateTime.parse(json['earth_date'] as String),
      rover: Rover.fromJson(json['rover'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RoverPhotoToJson(RoverPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sol': instance.sol,
      'camera': instance.camera,
      'img_src': instance.img_src,
      'earth_date': instance.earth_date.toIso8601String(),
      'rover': instance.rover,
    };
