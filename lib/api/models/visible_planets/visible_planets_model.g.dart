// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visible_planets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisiblePlanets _$VisiblePlanetsFromJson(Map<String, dynamic> json) =>
    VisiblePlanets(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: Map<String, String>.from(json['links'] as Map),
    );

Map<String, dynamic> _$VisiblePlanetsToJson(VisiblePlanets instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
      'links': instance.links,
    };
