// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'right_ascension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RightAscension _$RightAscensionFromJson(Map<String, dynamic> json) =>
    RightAscension(
      negative: json['negative'] as bool,
      hours: json['hours'] as int,
      minutes: json['minutes'] as int,
      seconds: (json['seconds'] as num).toDouble(),
      raw: (json['raw'] as num).toDouble(),
    );

Map<String, dynamic> _$RightAscensionToJson(RightAscension instance) =>
    <String, dynamic>{
      'negative': instance.negative,
      'hours': instance.hours,
      'minutes': instance.minutes,
      'seconds': instance.seconds,
      'raw': instance.raw,
    };
