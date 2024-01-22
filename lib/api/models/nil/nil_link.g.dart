// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nil_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NILLink _$NILLinkFromJson(Map<String, dynamic> json) => $checkedCreate(
      'NILLink',
      json,
      ($checkedConvert) {
        final val = NILLink(
          rel: $checkedConvert('rel', (v) => v as String),
          prompt: $checkedConvert('prompt', (v) => v as String?),
          href: $checkedConvert('href', (v) => v as String),
          render: $checkedConvert('render', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$NILLinkToJson(NILLink instance) => <String, dynamic>{
      'rel': instance.rel,
      'prompt': instance.prompt,
      'href': instance.href,
      'render': instance.render,
    };
