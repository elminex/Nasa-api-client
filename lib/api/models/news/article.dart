//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:nasa_api_app/api/models/news/event.dart';
import 'package:nasa_api_app/api/models/news/launch.dart';
part 'article.g.dart';

@JsonSerializable()
class Article {
  final int id;
  final String title;
  final String url;
  final String image_url;
  final String news_site;
  final String summary;
  final String published_at;
  final String updated_at;
  final bool featured;
  final List<Launch> launches;
  final List<Event> events;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Article(
      {required this.id,
      required this.title,
      required this.url,
      required this.image_url,
      required this.news_site,
      required this.summary,
      required this.published_at,
      required this.updated_at,
      required this.featured,
      required this.launches,
      required this.events});
}
