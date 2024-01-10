import 'package:json_annotation/json_annotation.dart';

part 'right_ascension.g.dart';

@JsonSerializable()
class RightAscension {
  final bool negative;
  final int hours;
  final int minutes;
  final double seconds;
  final double raw;

  RightAscension(
      {required this.negative,
      required this.hours,
      required this.minutes,
      required this.seconds,
      required this.raw});

  factory RightAscension.fromJson(Map<String, dynamic> json) =>
      _$RightAscensionFromJson(json);
}
