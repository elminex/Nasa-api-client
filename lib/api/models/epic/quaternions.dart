import 'package:json_annotation/json_annotation.dart';

part 'quaternions.g.dart';

@JsonSerializable()
class Quaternions {
  final double q0;
  final double q1;
  final double q2;
  final double q3;

  Quaternions(
      {required this.q1, required this.q2, required this.q3, required this.q0});

  factory Quaternions.fromJson(Map<String, dynamic> json) =>
      _$QuaternionsFromJson(json);
  Map<String, dynamic> toJson() => _$QuaternionsToJson(this);
}
