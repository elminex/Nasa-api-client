import 'package:json_annotation/json_annotation.dart';

import 'declination.dart';
import 'right_ascension.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  final String name;
  final String constellation;
  final RightAscension rightAscension;
  final Declination declination;
  final double altitude;
  final double azimuth;
  final bool aboveHorizon;
  final double magnitude;
  final bool nakedEyeObject;

  Data(
      {required this.name,
      required this.constellation,
      required this.rightAscension,
      required this.declination,
      required this.altitude,
      required this.azimuth,
      required this.aboveHorizon,
      required this.magnitude,
      required this.nakedEyeObject});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
