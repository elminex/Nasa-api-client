//ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'launch.g.dart';

@JsonSerializable()
class Launch {
  final String launch_id;
  final String provider;
  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Launch({required this.launch_id, required this.provider});
}
