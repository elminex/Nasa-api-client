// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String,
      constellation: json['constellation'] as String,
      rightAscension: RightAscension.fromJson(
          json['rightAscension'] as Map<String, dynamic>),
      declination:
          Declination.fromJson(json['declination'] as Map<String, dynamic>),
      altitude: (json['altitude'] as num).toDouble(),
      azimuth: (json['azimuth'] as num).toDouble(),
      aboveHorizon: json['aboveHorizon'] as bool,
      magnitude: (json['magnitude'] as num).toDouble(),
      nakedEyeObject: json['nakedEyeObject'] as bool,
    );
