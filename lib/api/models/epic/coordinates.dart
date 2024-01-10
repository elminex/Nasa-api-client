import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates {
  final double lat;
  final double lon;

  Coordinates(this.lat, this.lon);

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
