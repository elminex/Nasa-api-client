import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api_app/api/api_repository.dart';
import 'package:nasa_api_app/api/models/nil/filtered_nil_collection.dart';
import 'package:nasa_api_app/api/models/nil/filtered_nil_item.dart';

part 'nil_state.dart';

class NILCubit extends Cubit<NILState> {
  NILCubit() : super(NILInitial());

  void getCollections(String? query, String? url) async {
    emit(NILLoading());
    try {
      final collections = query != null && url == null
          ? await ApiRepository().getNILCollection(query)
          : await ApiRepository().getNILCollectionByPagination(url!);
      final items = collections.items.map((item) async {
        final List<String> imageList =
            await ApiRepository().getImageList(item.href);
        List<String> getImageLink() {
          final mediumImageLink =
              imageList.where((link) => link.contains("orig"));
          final thumbnailLink =
              imageList.where((link) => link.contains('thum'));
          return [mediumImageLink.first, thumbnailLink.first];
        }

        final title = item.data[0].title;
        final description = item.data[0].description;
        final imageHrefs = getImageLink();
        return FilteredNILItem(
          imageLinks: imageHrefs,
          title: title,
          description: description,
        );
      });
      final List<FilteredNILItem> awaitedItems = await Future.wait(items);
      final FilteredNILCollection filteredCollection =
          FilteredNILCollection(links: collections.links, items: awaitedItems);

      emit(NILLoaded(filteredCollection));
    } catch (error) {
      emit(NILError(error));
    }
  }
}
