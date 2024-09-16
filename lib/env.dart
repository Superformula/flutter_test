// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField()
  static const API_KEY = _Env.apiKey;
  @EnviedField()
  static const BASE_URL = _Env.baseUrl;
}
