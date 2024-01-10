import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:nasa_api_app/api/api_repository.dart';

import '../../../api/models/visible_planets/data.dart';
import '../../../utils/geolocator.dart';
part 'visible_planets_state.dart';

class VisiblePlanetsCubit extends Cubit<VisiblePlanetsState> {
  VisiblePlanetsCubit() : super(VisiblePlanetsInitial());

  void getVisiblePlanets() async {
    emit(VisiblePlanetsLoading());

    try {
      final localization = await determinePosition();
      //get geolocalization
      final lat = localization.latitude;
      final long = localization.longitude;
      final alt = localization.altitude;
      List<Data> response =
          await ApiRepository().getVisiblePlanets(lat, long, alt);
      emit(VisiblePlanetsLoaded(response));
    } catch (error) {
      emit(VisiblePlanetsError(error));
    }
  }
}
