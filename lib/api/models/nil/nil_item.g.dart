// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nil_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NILItem _$NILItemFromJson(Map<String, dynamic> json) => NILItem(
      href: json['href'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => NILData.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>)
          .map((e) => NILLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NILItemToJson(NILItem instance) => <String, dynamic>{
      'href': instance.href,
      'data': instance.data,
      'links': instance.links,
    };
