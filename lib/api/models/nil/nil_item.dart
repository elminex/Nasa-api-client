//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

import 'nil_data.dart';
import 'nil_link.dart';
part 'nil_item.g.dart';

@JsonSerializable()
class NILItem {
  final String href;
  final List<NILData> data;
  final List<NILLink> links;

  factory NILItem.fromJson(Map<String, dynamic> json) =>
      _$NILItemFromJson(json);

  NILItem({required this.href, required this.data, required this.links});
}
