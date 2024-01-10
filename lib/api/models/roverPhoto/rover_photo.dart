// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'rover.dart';
import 'rover_camera.dart';

part 'rover_photo.g.dart';

@JsonSerializable()
class RoverPhoto {
  final int id;
  final int sol;
  final RoverCamera camera;
  final String img_src;
  final DateTime earth_date;
  final Rover rover;

  factory RoverPhoto.fromJson(Map<String, dynamic> json) =>
      _$RoverPhotoFromJson(json);

  RoverPhoto(
      {required this.id,
      required this.sol,
      required this.camera,
      required this.img_src,
      required this.earth_date,
      required this.rover});
}
