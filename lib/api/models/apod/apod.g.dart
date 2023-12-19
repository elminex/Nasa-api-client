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
