import 'package:nasa_api_app/api/models/nil/filtered_nil_item.dart';
import 'package:nasa_api_app/api/models/nil/nil_link.dart';

class FilteredNILCollection {
  final List<NILLink> links;
  final List<FilteredNILItem> items;

  FilteredNILCollection({
    required this.links,
    required this.items,
  });
}
