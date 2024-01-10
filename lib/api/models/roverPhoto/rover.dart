// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'rover_camera.dart';

part 'rover.g.dart';

@JsonSerializable()
class Rover {
  final int id;
  final String name;
  final DateTime landing_date;
  final DateTime launch_date;
  final String status;
  final int max_sol;
  final DateTime max_date;
  final int total_photos;
  final List<RoverCamera> cameras;

  factory Rover.fromJson(Map<String, dynamic> json) => _$RoverFromJson(json);

  Rover(
      {required this.id,
      required this.name,
      required this.landing_date,
      required this.launch_date,
      required this.status,
      required this.max_sol,
      required this.max_date,
      required this.total_photos,
      required this.cameras});
}
