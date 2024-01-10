//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'nil_link.g.dart';

@JsonSerializable()
class NILLink {
  final String rel;
  final String? prompt;
  final String href;
  final String? render;
  factory NILLink.fromJson(Map<String, dynamic> json) =>
      _$NILLinkFromJson(json);

  NILLink(
      {required this.rel,
      required this.prompt,
      required this.href,
      required this.render});
}
