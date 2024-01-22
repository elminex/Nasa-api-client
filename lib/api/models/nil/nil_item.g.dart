// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nil_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NILItem _$NILItemFromJson(Map<String, dynamic> json) => $checkedCreate(
      'NILItem',
      json,
      ($checkedConvert) {
        final val = NILItem(
          href: $checkedConvert('href', (v) => v as String),
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>)
                  .map((e) => NILData.fromJson(e as Map<String, dynamic>))
                  .toList()),
          links: $checkedConvert(
              'links',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => NILLink.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$NILItemToJson(NILItem instance) => <String, dynamic>{
      'href': instance.href,
      'data': instance.data,
      'links': instance.links,
    };
