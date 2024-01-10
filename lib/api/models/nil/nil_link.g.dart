// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nil_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NILLink _$NILLinkFromJson(Map<String, dynamic> json) => NILLink(
      rel: json['rel'] as String,
      prompt: json['prompt'] as String?,
      href: json['href'] as String,
      render: json['render'] as String?,
    );

Map<String, dynamic> _$NILLinkToJson(NILLink instance) => <String, dynamic>{
      'rel': instance.rel,
      'prompt': instance.prompt,
      'href': instance.href,
      'render': instance.render,
    };
