import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_api_app/api/api_repository.dart';

part 'nil_image_state.dart';

class NilImageCubit extends Cubit<NILImageState> {
  NilImageCubit() : super(NILImageInitial());

  void getNILImage(String imageListLink) async {
    emit(NILImageLoading());
    try {
      final imageList = await ApiRepository().getImageList(imageListLink);
      String getImageLink() {
        final mediumImageLink = imageList.where((link) {
          return link.contains("orig");
        });
        return mediumImageLink.first;
      }

      final String imageLink = getImageLink();
      emit(NILImageLoaded(imageLink));
    } catch (error) {
      emit(NILImageError(error));
    }
  }
}
