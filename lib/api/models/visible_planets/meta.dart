import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  final DateTime time;
  final String engineVersion;
  final double latitude;
  final double longitude;
  final int elevation;
  final bool aboveHorizon;

  Meta(
      {required this.time,
      required this.engineVersion,
      required this.latitude,
      required this.longitude,
      required this.elevation,
      required this.aboveHorizon});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
