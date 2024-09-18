import 'package:shared_preferences/shared_preferences.dart';

import 'cache.dart';

class LocalStorageAdapter implements SaveCache, FetchCache {
  @override
  Future<void> save({required String key, required String value}) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString(key, value);
  }

  @override
  Future<String?> fetch(String key) async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(key);
  }
}
