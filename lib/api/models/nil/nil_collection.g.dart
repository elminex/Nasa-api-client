// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nil_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NILCollection _$NILCollectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'NILCollection',
      json,
      ($checkedConvert) {
        final val = NILCollection(
          version: $checkedConvert('version', (v) => v as String),
          href: $checkedConvert('href', (v) => v as String),
          items: $checkedConvert(
              'items',
              (v) => (v as List<dynamic>)
                  .map((e) => NILItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
          metadata: $checkedConvert('metadata',
              (v) => NILMetadata.fromJson(v as Map<String, dynamic>)),
          links: $checkedConvert(
              'links',
              (v) => (v as List<dynamic>)
                  .map((e) => NILLink.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$NILCollectionToJson(NILCollection instance) =>
    <String, dynamic>{
      'version': instance.version,
      'href': instance.href,
      'items': instance.items,
      'metadata': instance.metadata,
      'links': instance.links,
    };
