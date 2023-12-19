// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'coordinates.dart';
import 'j2000_position.dart';
import 'quaternions.dart';

part 'epic.g.dart';

@JsonSerializable()
class Epic {
  String image;
  final String date;
  final String caption;
  final Coordinates centroid_coordinates;
  final J2000Position dscovr_j2000_position;
  final J2000Position lunar_j2000_position;
  final J2000Position sun_j2000_position;
  final Quaternions attitude_quaternions;

  factory Epic.fromJson(Map<String, dynamic> json) => _$EpicFromJson(json);

  Epic({
    required this.image,
    required this.date,
    required this.caption,
    required this.centroid_coordinates,
    required this.dscovr_j2000_position,
    required this.lunar_j2000_position,
    required this.sun_j2000_position,
    required this.attitude_quaternions,
  });
}
