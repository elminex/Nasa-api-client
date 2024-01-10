// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'nil_metadata.g.dart';

@JsonSerializable()
class NILMetadata {
  final int total_hits;
  factory NILMetadata.fromJson(Map<String, dynamic> json) =>
      _$NILMetadataFromJson(json);

  NILMetadata({required this.total_hits});
}
