import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../failures/app_exception.dart';
import 'module_communication_interface.dart';
import '../utils/logger.dart';

class ModuleCommunication implements ModuleCommunicationInterface {
  static bool hasNoInternetToast = true;
  static late LazyBox _collectionInstance;

  static ModuleCommunication? singleInstance;
  static ModuleCommunication getInstance() {
    singleInstance ??= ModuleCommunication();
    return singleInstance!;
  }

  ModuleCommunication();

  static String step = '0';
  static String errorBeforeClean = '';
  static bool recovered = false;

  static String hardwareId = '';

  static Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    try {
      _collectionInstance = await Hive.openLazyBox('superformula_app');
    } catch (error) {
      recovered = true;
      errorBeforeClean = error.toString();
      Hive.deleteBoxFromDisk('superformula_app');
      _collectionInstance = await Hive.openLazyBox('superformula_app');
    }
  }

  @override
  Future<void> put(KeyStorage key, List<String> value) async {
    if (_collectionInstance.isOpen) {
      await _collectionInstance.put(key.name, value);
    }
  }

  @override
  Future<List<String>?> get(
    KeyStorage key, {
    dynamic defaultValue,
  }) async {
    if (_collectionInstance.isOpen) {
      final List<String>? result = await _collectionInstance.get(key.name);
      return result ?? [];
    }
    return [];
  }

  @override
  Future<void> delete(KeyStorage key) async {
    if (_collectionInstance.isOpen) {
      await _collectionInstance.delete(key.name);
    }
  }

  @override
  Future<void> close() async {
    if (_collectionInstance.isOpen) {
      await _collectionInstance.close();
    }
  }

  @override
  Stream stream({KeyStorage? key}) => _collectionInstance.watch(key: key);

  @override
  Future<void> save(String key, dynamic value) async {
    if (_collectionInstance.isOpen) {
      await _collectionInstance.put(key, value);
    }
  }

  @override
  Future<bool?> getBool(String key) {
    if (_collectionInstance.isOpen) {
      return _collectionInstance.get(key).then((value) {
        if (value == null) {
          return value;
        }
        return value as bool;
      });
    }
    return Future.error(const AppException('Key not found'));
  }

  @override
  Future<String?> getString(String key) {
    if (_collectionInstance.isOpen) {
      return _collectionInstance.get(key).then((value) {
        if (value == null) {
          return null;
        }
        return value as String;
      });
    }
    return Future.error(const AppException('Key not found'));
  }

  @override
  Future<num?> getNum(String key) {
    if (_collectionInstance.isOpen) {
      return _collectionInstance.get(key).then((value) {
        if (value == null) {
          return null;
        }
        return value as num;
      });
    }
    return Future.error(const AppException('Key not found'));
  }

  @override
  Stream<T> observe<T>(String key) {
    return _collectionInstance.watch(key: key).map((event) => event.value as T);
  }

  @override
  Future<void> setItem(String key, String value) {
    return save(key, value);
  }

  static Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  static Future<bool> hasFile(String filename) async {
    final String localPath = await _localPath;
    final File file = File('$localPath/$filename');
    return file.exists();
  }

  static Future<void> createFile(String filename, String text) async {
    final String localPath = await _localPath;
    final File file = File('$localPath/$filename');
    await file.writeAsString(text);
  }

  static Future<String> readFile(String filename) async {
    final String localPath = await _localPath;
    final File file = File('$localPath/$filename');
    return file.readAsString();
  }

  static Future<void> deleteFile(String filename) async {
    final String localPath = await _localPath;
    final File file = File('$localPath/$filename');
    if (file.existsSync()) await file.delete();
  }

  static Future<void> renameFile(String filename, String filenameNew) async {
    final String localPath = await _localPath;
    final File file = File('$localPath/$filename');
    await file.rename('$localPath/$filenameNew');
  }

  @override
  Future<Map<String, dynamic>> getMap(String key, {defaultValue}) async {
    try {
      if (_collectionInstance.isOpen) {
        final value =
            await _collectionInstance.get(key, defaultValue: defaultValue);
        if (value == null) return {};
        return Map<String, dynamic>.from(value);
      }
    } catch (e, s) {
      Logger.log(e.toString());
      Logger.log(s.toString());
    }
    throw const AppException('Key not found');
  }
}
