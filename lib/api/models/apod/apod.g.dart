// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apod _$ApodFromJson(Map<String, dynamic> json) => Apod(
      copyright: json['copyright'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      explanation: json['explanation'] as String?,
      hdurl: json['hdurl'] as String?,
      media_type: json['media_type'] as String?,
      service_version: json['service_version'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ApodToJson(Apod instance) => <String, dynamic>{
      'copyright': instance.copyright,
      'date': instance.date?.toIso8601String(),
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'media_type': instance.media_type,
      'service_version': instance.service_version,
      'title': instance.title,
      'url': instance.url,
    };
