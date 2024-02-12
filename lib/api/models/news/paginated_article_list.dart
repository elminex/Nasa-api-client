//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

import 'article.dart';
part 'paginated_article_list.g.dart';

@JsonSerializable()
class PaginatedArticleList {
  final int count;
  final String? next;
  final String? previous;
  List<Article> results;

  factory PaginatedArticleList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedArticleListFromJson(json);

  PaginatedArticleList(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});
}
