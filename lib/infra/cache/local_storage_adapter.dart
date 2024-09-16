import 'package:shared_preferences/shared_preferences.dart';

import 'cache.dart';

class LocalStorageAdapter implements SaveCache, FetchCache, DeleteCache {
  late final SharedPreferences storage;

  LocalStorageAdapter() {
    SharedPreferences.getInstance().then((instance) => storage = instance);
  }

  @override
  Future<void> save({required String key, required String value}) async {
    await storage.setString(key, value);
  }

  @override
  Future<String?> fetch(String key) async {
    return storage.getString(key);
  }

  @override
  Future<void> delete(String key) async {
    storage.remove(key);
  }
}
