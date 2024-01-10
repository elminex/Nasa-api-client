// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Epic _$EpicFromJson(Map<String, dynamic> json) => Epic(
      image: json['image'] as String,
      date: json['date'] as String,
      caption: json['caption'] as String,
      centroid_coordinates: Coordinates.fromJson(
          json['centroid_coordinates'] as Map<String, dynamic>),
      dscovr_j2000_position: J2000Position.fromJson(
          json['dscovr_j2000_position'] as Map<String, dynamic>),
      lunar_j2000_position: J2000Position.fromJson(
          json['lunar_j2000_position'] as Map<String, dynamic>),
      sun_j2000_position: J2000Position.fromJson(
          json['sun_j2000_position'] as Map<String, dynamic>),
      attitude_quaternions: Quaternions.fromJson(
          json['attitude_quaternions'] as Map<String, dynamic>),
    );
