import 'package:nasa_api_app/api/api_service.dart';
import 'package:nasa_api_app/utils/random_apod_generator.dart';

import 'models/apod/apod.dart';
import 'models/epic/epic.dart';

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
}
