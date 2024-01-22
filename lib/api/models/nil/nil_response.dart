//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_api_app/api/models/nil/nil_collection.dart';
part 'nil_response.g.dart';

@JsonSerializable()
class NILResponse {
  final NILCollection collection;
  factory NILResponse.fromJson(Map<String, dynamic> json) =>
      _$NILResponseFromJson(json);

  NILResponse({required this.collection});
}
