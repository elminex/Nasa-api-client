import 'package:http/http.dart' as http;
import 'package:nasa_api_app/api/models/apod/apod.dart';
import 'package:nasa_api_app/api/models/epic/epic.dart';

import 'dart:convert';
import 'package:nasa_api_app/env/env.dart';

class ApiService {
  ApiService({this.baseUrl = 'https://api.nasa.gov'});
  final String baseUrl;

  Uri getUrl({
    required String url,
    Map<String, String>? queryParams,
  }) {
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
}
