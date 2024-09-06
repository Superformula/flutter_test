import 'package:cache/repository/cache_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsCacheReppository implements SFCacheManager {
  final SharedPreferences pref;

  SharedPrefsCacheReppository({required this.pref});
  @override
  Future<String?> getString(String cacheKey) async {
    return pref.getString(cacheKey);
  }

  @override
  Future<void> reset() async {
    try {
      pref.clear();
    } catch (e) {
      throw Exception("Could not clear cache");
    }
  }

  @override
  Future<void> setString(String cacheKey, String value) async {
    try {
      pref.setString(cacheKey, value);
    } catch (e) {
      throw Exception("Could not set value on key $cacheKey");
    }
  }
}
