import 'package:json_annotation/json_annotation.dart';

part 'declination.g.dart';

@JsonSerializable()
class Declination {
  final bool negative;
  final int degrees;
  final int arcminutes;
  final double arcseconds;
  final double raw;

  Declination(
      {required this.negative,
      required this.degrees,
      required this.arcminutes,
      required this.arcseconds,
      required this.raw});
  factory Declination.fromJson(Map<String, dynamic> json) =>
      _$DeclinationFromJson(json);
}
