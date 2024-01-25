import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:nasa_api_app/api/api_repository.dart';
import 'package:nasa_api_app/api/models/roverPhoto/rover_photo.dart';

part 'mars_rover_state.dart';

class MarsRoverCubit extends Cubit<MarsRoverState> {
  MarsRoverCubit() : super(MarsRoverInitial());

  void getRoverPhoto(String roverName, String date, String roverCamera) async {
    emit(MarsRoverLoading());
    try {
      List<RoverPhoto> response =
          await ApiRepository().getRoverPhotos(roverName, date, roverCamera);
      if (response.isNotEmpty) {
        emit(MarsRoverLoaded(response));
      } else {
        emit(MarsRoverLoadedNoImages());
      }
    } catch (error) {
      emit(MarsRoverError(error));
    }
  }
}
