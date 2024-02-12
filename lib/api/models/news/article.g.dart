// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      image_url: json['image_url'] as String,
      news_site: json['news_site'] as String,
      summary: json['summary'] as String,
      published_at: json['published_at'] as String,
      updated_at: json['updated_at'] as String,
      featured: json['featured'] as bool,
      launches: (json['launches'] as List<dynamic>)
          .map((e) => Launch.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'image_url': instance.image_url,
      'news_site': instance.news_site,
      'summary': instance.summary,
      'published_at': instance.published_at,
      'updated_at': instance.updated_at,
      'featured': instance.featured,
      'launches': instance.launches,
      'events': instance.events,
    };
