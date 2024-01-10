import 'package:json_annotation/json_annotation.dart';

part 'rover_response.g.dart';

@JsonSerializable()
class RoverResponse {
  final List<Map<String, dynamic>> photos;

  RoverResponse({required this.photos});
  factory RoverResponse.fromJson(Map<String, dynamic> json) =>
      _$RoverResponseFromJson(json);
}
