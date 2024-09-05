import 'package:cache/repository/cache_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsCacheReppository implements SFCacheManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<String?> getString(String cacheKey) {
    return _prefs.then((cache) => cache.getString(cacheKey));
  }

  @override
  void reset() {
    try {
      _prefs.then((cache) => cache.clear());
    } catch (e) {
      throw Exception("Could not clear cache");
    }
  }

  @override
  void setString(String cacheKey, String value) {
    try {
      _prefs.then((cache) => cache.setString(cacheKey, value));
    } catch (e) {
      throw Exception("Could not set value on key $cacheKey");
    }
  }
}
