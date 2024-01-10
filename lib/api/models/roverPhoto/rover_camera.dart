// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'rover_camera.g.dart';

@JsonSerializable()
class RoverCamera {
  final int? id;
  final String name;
  final int? rover_id;
  final String full_name;

  factory RoverCamera.fromJson(Map<String, dynamic> json) =>
      _$RoverCameraFromJson(json);

  RoverCamera(
      {this.id, required this.name, this.rover_id, required this.full_name});
}
