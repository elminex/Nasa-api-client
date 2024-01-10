import 'package:json_annotation/json_annotation.dart';

part 'j2000_position.g.dart';

@JsonSerializable()
class J2000Position {
  final double x;
  final double y;
  final double z;

  factory J2000Position.fromJson(Map<String, dynamic> json) =>
      _$J2000PositionFromJson(json);
  Map<String, dynamic> toJson() => _$J2000PositionToJson(this);

  J2000Position({required this.x, required this.y, required this.z});
}
