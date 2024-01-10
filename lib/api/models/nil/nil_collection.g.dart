// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nil_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NILCollection _$NILCollectionFromJson(Map<String, dynamic> json) =>
    NILCollection(
      version: json['version'] as String,
      href: json['href'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => NILItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: NILMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      links: (json['links'] as List<dynamic>)
          .map((e) => NILLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NILCollectionToJson(NILCollection instance) =>
    <String, dynamic>{
      'version': instance.version,
      'href': instance.href,
      'items': instance.items,
      'metadata': instance.metadata,
      'links': instance.links,
    };
