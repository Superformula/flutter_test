enum KeyStorage { favorities }

extension KeyStorageName on KeyStorage {
  String get name => toString().split('.')[1];
}

abstract class ModuleCommunicationInterface {
  Future<void> put(KeyStorage key, List<String> value);

  Stream stream({KeyStorage? key});
  Stream<T> observe<T>(String key);

  Future<List<String>?> get(KeyStorage key);
  Future<Map<String, dynamic>> getMap(String key, {dynamic defaultValue});

  Future<void> delete(KeyStorage key);

  Future<void> close();

  Future<void> save(String element, dynamic value);
  Future<String?> getString(String key);
  Future<bool?> getBool(String key);
  Future<num?> getNum(String key);

  Future<void> setItem(String key, String value);
}
