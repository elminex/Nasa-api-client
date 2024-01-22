// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nil_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NILData _$NILDataFromJson(Map<String, dynamic> json) => NILData(
      center: json['center'] as String,
      title: json['title'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      nasa_id: json['nasa_id'] as String,
      date_created: DateTime.parse(json['date_created'] as String),
      media_type: json['media_type'] as String,
      description: json['description'] as String,
      description_508: json['description_508'] as String?,
      secondary_creator: json['secondary_creator'] as String?,
      album:
          (json['album'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NILDataToJson(NILData instance) => <String, dynamic>{
      'center': instance.center,
      'title': instance.title,
      'keywords': instance.keywords,
      'nasa_id': instance.nasa_id,
      'date_created': instance.date_created.toIso8601String(),
      'media_type': instance.media_type,
      'secondary_creator': instance.secondary_creator,
      'description': instance.description,
      'description_508': instance.description_508,
      'album': instance.album,
    };
