abstract class SFCacheManager {
  Future<String?> getString(String cacheKey);
  Future<void> setString(String cacheKey, String value);
  Future<void> reset();
}
