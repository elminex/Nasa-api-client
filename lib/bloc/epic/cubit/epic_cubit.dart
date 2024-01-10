import 'package:bloc/bloc.dart';
import 'package:nasa_api_app/api/api_repository.dart';
import 'package:nasa_api_app/api/models/epic/epic.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'epic_state.dart';

void _createUrl(Epic elem, String type) {
  final date = DateTime.parse(elem.date);
  final url =
      'https://epic.gsfc.nasa.gov/archive/$type/${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/jpg/${elem.image}.jpg';
  elem.image = url;
}

class EpicCubit extends Cubit<EpicState> {
  EpicCubit() : super(EpicInitial());

  void getImages(String type) async {
    emit(EpicLoading());
    try {
      final metadata = await ApiRepository().getImageMetadata(type);
      for (final elem in metadata) {
        _createUrl(elem, type);
      }
      emit(EpicLoaded(metadata));
    } catch (error) {
      emit(EpicError(error));
    }
  }
}
