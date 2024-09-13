import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'YELP_KEY', obfuscate: true)
  static String yelpApiKey = _Env.yelpApiKey;
}
