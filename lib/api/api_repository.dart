import 'package:nasa_api_app/api/api_service.dart';
import 'package:nasa_api_app/api/models/nil/nil_collection.dart';
import 'package:nasa_api_app/api/models/roverPhoto/rover_photo.dart';
import 'package:nasa_api_app/utils/random_apod_generator.dart';

import 'package:nasa_api_app/api/models/apod/apod.dart';
import 'package:nasa_api_app/api/models/epic/epic.dart';
import 'package:nasa_api_app/api/models/visible_planets/data.dart';

class ApiRepository {
  Future<Apod> getCurrentApod() async => ApiService().getAPOD({});
  Future<Apod> getRandomApod() async =>
      ApiService().getAPOD({"date": getUrlOfRandomApod()});

  Future<List<Epic>> getImageMetadata(String type) async =>
      ApiService().getEpic(type);

  Future<List<RoverPhoto>> getRoverPhotos(
          String roverName, String date, String roverCamera) async =>
      ApiService().getRoverPhoto(roverName, date, roverCamera);

  Future<List<Data>> getVisiblePlanets(double lat, double long, double alt) =>
      ApiService().getVisiblePlanets(lat, long, alt);

  Future<NILCollection> getNILCollection(String query) =>
      ApiService().getNilSearchResult(query);

  Future<List<String>> getImageList(String link) =>
      ApiService().getImageList(link);
}
