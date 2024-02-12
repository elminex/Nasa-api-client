//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'event.g.dart';

@JsonSerializable()
class Event {
  final int event_id;
  final String provider;
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Event({required this.event_id, required this.provider});
}
