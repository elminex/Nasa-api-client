import 'package:json_annotation/json_annotation.dart';

import 'nil_item.dart';
import 'nil_metadata.dart';
import 'nil_link.dart';
part 'nil_collection.g.dart';

@JsonSerializable()
class NILCollection {
  final String version;
  final String href;
  final List<NILItem> items;
  final NILMetadata metadata;
  final List<NILLink> links;

  NILCollection(
      {required this.version,
      required this.href,
      required this.items,
      required this.metadata,
      required this.links});

  factory NILCollection.fromJson(Map<String, dynamic> json) =>
      _$NILCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$NILCollectionToJson(this);
}
