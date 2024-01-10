//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'nil_data.g.dart';

@JsonSerializable()
class NILData {
  final String center;
  final String title;
  final List<String> keywords;
  final String nasa_id;
  final DateTime date_created;
  final String media_type;
  final String description;
  factory NILData.fromJson(Map<String, dynamic> json) =>
      _$NILDataFromJson(json);

  NILData(
      {required this.center,
      required this.title,
      required this.keywords,
      required this.nasa_id,
      required this.date_created,
      required this.media_type,
      required this.description});
}
