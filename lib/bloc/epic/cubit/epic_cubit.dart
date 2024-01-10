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

  void getNaturalImages() async {
    emit(EpicLoading());
    try {
      final metadata = await ApiRepository().getNormalImageMetadata();
      for (final elem in metadata) {
        _createUrl(elem, "natural");
      }
      emit(EpicLoaded(metadata));
    } catch (error) {
      emit(EpicError(error));
    }
  }

  void getEnhancedImages() async {
    emit(EpicLoading());
    try {
      final metadata = await ApiRepository().getEnhancedImageMetadata();
      for (final elem in metadata) {
        _createUrl(elem, "enhanced");
      }
      emit(EpicLoaded(metadata));
    } catch (error) {
      emit(EpicError(error));
    }
  }

  void getAerosolImages() async {
    emit(EpicLoading());
    try {
      final metadata = await ApiRepository().getAerosolImageMetadata();
      for (final elem in metadata) {
        _createUrl(elem, "aerosol");
      }
      emit(EpicLoaded(metadata));
    } catch (error) {
      emit(EpicError(error));
    }
  }

  void getCloudImages() async {
    emit(EpicLoading());
    try {
      final metadata = await ApiRepository().getCloudImageMetadata();
      for (final elem in metadata) {
        _createUrl(elem, "cloud");
      }
      emit(EpicLoaded(metadata));
    } catch (error) {
      emit(EpicError(error));
    }
  }
}
