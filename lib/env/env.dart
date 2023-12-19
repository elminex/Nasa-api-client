// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'api.env')
abstract class Env {
  @EnviedField(varName: 'key', obfuscate: true)
  static String key = _Env.key;
}
