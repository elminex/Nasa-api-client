import 'package:http/http.dart' as http;
import 'package:nasa_api_app/api/models/apod/apod.dart';
import 'package:nasa_api_app/api/models/epic/epic.dart';
import 'package:nasa_api_app/api/models/news/paginated_article_list.dart';
import 'package:nasa_api_app/api/models/nil/nil_response.dart';
import 'package:nasa_api_app/api/models/roverPhoto/rover_response.dart';
import 'package:nasa_api_app/api/models/visible_planets/visible_planets_model.dart';

import 'dart:convert';
import 'package:nasa_api_app/env/env.dart';

import 'models/nil/nil_collection.dart';
import 'models/roverPhoto/rover_photo.dart';
import 'models/visible_planets/data.dart';

class ApiService {
  ApiService({this.baseUrl = 'https://api.nasa.gov'});
  final String baseUrl;

  Uri getUrl({required String url, Map<String, String>? queryParams}) {
    return Uri.parse('$baseUrl/$url').replace(queryParameters: queryParams);
  }

  Future<Apod> getAPOD(Map<String, dynamic>? extraParams) async {
    final response = await http.get(getUrl(
        url: 'planetary/apod',
        queryParams: {'api_key': Env.key, ...?extraParams}));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return Apod.fromJson(json.decode(response.body));
      } else {
        throw Exception("Response is empty");
      }
    }
    throw Exception(
        "Error fetching data. Status code: ${response.statusCode}, response: ${response.body}");
  }

  Future<List<Epic>> getEpic(String type) async {
    final response = await http
        .get(getUrl(url: "EPIC/api/$type", queryParams: {'api_key': Env.key}));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final List body = json.decode(response.body);
        return body.map((element) => Epic.fromJson(element)).toList();
      } else {
        throw Exception("Response is empty");
      }
    }
    throw Exception(
        "Error fetching data. Status code: ${response.statusCode}, response: ${response.body}");
  }

  Future<List<RoverPhoto>> getRoverPhoto(
      String roverName, String date, String roverCamera) async {
    final response = await http.get(getUrl(
        url: "mars-photos/api/v1/rovers/$roverName/photos",
        queryParams: {
          "earth_date": date,
          "api_key": Env.key,
          ...roverCamera == "all" ? {} : {"camera": roverCamera}
        }));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final RoverResponse body =
            RoverResponse.fromJson(json.decode(response.body));
        return body.photos
            .map((element) => RoverPhoto.fromJson(element))
            .toList();
      } else {
        throw Exception("Response is empty");
      }
    }
    throw Exception(
        "Error fetching data. Status code: ${response.statusCode}, response: ${response.body}");
  }

  Future<List<Data>> getVisiblePlanets(
      double userLatitude, double userLongitude, double userAltitude) async {
    final response = await http.get(
        Uri.parse('https://api.visibleplanets.dev/v3')
            .replace(queryParameters: {
      "latitude": '$userLatitude',
      "longitude": '$userLongitude',
      "elevation": '$userAltitude',
    }));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final VisiblePlanets body =
            VisiblePlanets.fromJson(json.decode(response.body));
        return body.data;
      } else {
        throw Exception("Response is empty");
      }
    }
    throw Exception(
        "Error fetching data. Status code: ${response.statusCode}, response: ${response.body}");
  }

  Future<NILCollection> getNilSearchResult(
      String? query, String? paginationUrl) async {
    const String apiUrl = 'https://images-api.nasa.gov/search';
    final Uri initialUrl = Uri.parse(apiUrl).replace(queryParameters: {
      "q": query,
      "media_type": "image",
      "page_size": "8",
    });
    final response = await http
        .get(paginationUrl != null ? Uri.parse(paginationUrl) : initialUrl);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final NILResponse body =
            NILResponse.fromJson(json.decode(response.body));
        return body.collection;
      } else {
        throw Exception("Response is empty");
      }
    }
    throw Exception(
        "Error fetching data. Status code: ${response.statusCode}, response: ${response.body}");
  }

  Future<List<String>> getImageList(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final body = List<String>.from(json.decode(response.body));
        return body;
      } else {
        throw Exception("Response is empty");
      }
    }
    throw Exception(
        "Error fetching data. Status code: ${response.statusCode}, response: ${response.body}");
  }

  Future<PaginatedArticleList> getNews(
      int? currentPage, int? pageSize, String? paginationUrl) async {
    const String apiUrl = 'https://api.spaceflightnewsapi.net/v4/articles';
    Uri getInitialUrl() => Uri.parse(apiUrl).replace(queryParameters: {
          "limit": pageSize.toString(),
          "offset": '${pageSize! * (currentPage! - 1)}',
        });
    final response = await http.get(
        paginationUrl != null && pageSize == null && currentPage == null
            ? Uri.parse(paginationUrl)
            : getInitialUrl());
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final body = PaginatedArticleList.fromJson(json.decode(response.body));
        return body;
      } else {
        throw Exception("Response is empty");
      }
    }
    throw Exception(
        "Error fetching data. Status code: ${response.statusCode}, response: ${response.body}");
  }
}
