abstract class SFCacheManager {
  Future<String?> getString(String cacheKey);
  void setString(String cacheKey, String value);
  void reset();
}
