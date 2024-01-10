import 'package:nasa_api_app/api/api_service.dart';
import 'package:nasa_api_app/api/models/roverPhoto/rover_photo.dart';
import 'package:nasa_api_app/utils/random_apod_generator.dart';

import 'models/apod/apod.dart';
import 'models/epic/epic.dart';
import 'models/visible_planets/data.dart';

class ApiRepository {
  Future<Apod> getCurrentApod() async => ApiService().getAPOD({});
  Future<Apod> getRandomApod() async =>
      ApiService().getAPOD({"date": getUrlOfRandomApod()});

  Future<List<Epic>> getNormalImageMetadata() async =>
      ApiService().getEpic("natural");
  Future<List<Epic>> getEnhancedImageMetadata() async =>
      ApiService().getEpic("enhanced");
  Future<List<Epic>> getAerosolImageMetadata() async =>
      ApiService().getEpic("aerosol");
  Future<List<Epic>> getCloudImageMetadata() async =>
      ApiService().getEpic("cloud");

  Future<List<RoverPhoto>> getRoverPhotos(
          String roverName, String date, String roverCamera) async =>
      ApiService().getRoverPhoto(roverName, date, roverCamera);

  Future<List<Data>> getVisiblePlanets(double lat, double long, double alt) =>
      ApiService().getVisiblePlanets(lat, long, alt);
}
