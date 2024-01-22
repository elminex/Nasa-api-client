//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'nil_link.g.dart';

@JsonSerializable(checked: true)
class NILLink {
  final String rel;
  final String? prompt;
  final String href;
  final String? render;
  factory NILLink.fromJson(Map<String, dynamic> json) =>
      _$NILLinkFromJson(json);

  NILLink({required this.rel, this.prompt, required this.href, this.render});
}
