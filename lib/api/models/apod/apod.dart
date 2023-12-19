// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'apod.g.dart';

@JsonSerializable()
class Apod {
  final String? copyright;
  final DateTime? date;
  final String? explanation;
  final String? hdurl;
  final String? media_type;
  final String? service_version;
  final String? title;
  final String? url;

  Apod({
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.media_type,
    this.service_version,
    this.title,
    this.url,
  });

  factory Apod.fromJson(Map<String, dynamic> json) => _$ApodFromJson(json);
}
