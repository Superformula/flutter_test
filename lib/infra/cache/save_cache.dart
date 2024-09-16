abstract class SaveCache<T> {
  Future<T> save({required String key, String? value});
}
