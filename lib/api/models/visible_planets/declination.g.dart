// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'declination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Declination _$DeclinationFromJson(Map<String, dynamic> json) => Declination(
      negative: json['negative'] as bool,
      degrees: json['degrees'] as int,
      arcminutes: json['arcminutes'] as int,
      arcseconds: (json['arcseconds'] as num).toDouble(),
      raw: (json['raw'] as num).toDouble(),
    );
