import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
import 'meta.dart';

part 'visible_planets_model.g.dart';

@JsonSerializable()
class VisiblePlanets {
  final Meta meta;
  final List<Data> data;
  final Map<String, String> links;

  VisiblePlanets({required this.meta, required this.data, required this.links});

  factory VisiblePlanets.fromJson(Map<String, dynamic> json) =>
      _$VisiblePlanetsFromJson(json);
}
