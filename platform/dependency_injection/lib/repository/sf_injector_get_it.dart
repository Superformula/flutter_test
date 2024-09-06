import 'package:dependency_injection/domain/sf_injector.dart';
import 'package:get_it/get_it.dart';

class SFInjectorGetIt implements SFInjector {
  final GetIt _getIt = GetIt.instance;

  @override
  T get<T extends Object>({String? instanceName}) {
    try {
      return _getIt.get<T>(instanceName: instanceName);
    } catch (e) {
      throw Exception("Error while getting instance from injection $e");
    }
  }

  @override
  bool exists<T extends Object>({String? instanceName}) {
    try {
      _getIt.get<T>(instanceName: instanceName);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  void registerFactory<T extends Object>(T Function() factoryFunc,
      {String? instanceName}) {
    try {
      _getIt.registerFactory<T>(factoryFunc, instanceName: instanceName);
    } catch (e) {
      throw Exception("Error while getting instance from injection $e");
    }
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() factoryFunc,
      {String? instanceName}) {
    try {
      _getIt.registerLazySingleton<T>(factoryFunc, instanceName: instanceName);
    } catch (e) {
      throw Exception("Error while getting instance from injection $e");
    }
  }

  @override
  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    try {
      _getIt.registerSingleton<T>(instance, instanceName: instanceName);
    } catch (e) {
      throw Exception("Error while getting instance from injection $e");
    }
  }

  @override
  Future<void> unregister<T extends Object>({String? instanceName}) async {
    try {
      await _getIt.unregister<T>(instanceName: instanceName);
    } catch (e) {
      throw Exception("Error while getting instance from injection $e");
    }
  }

  @override
  Future<void> reset() async {
    await GetIt.I.reset();
  }

  @override
  T getOrRegister<T extends Object>(T factoryFunc) {
    try {
      bool isRegistered = _getIt.isRegistered<T>();
      late T objectInstance;

      if (!isRegistered) {
        _getIt.registerSingleton<T>(factoryFunc);
        objectInstance = _getIt.get<T>();
      } else {
        objectInstance = _getIt.get<T>();
      }

      return objectInstance;
    } catch (e) {
      throw Exception("Error while getting instance from injection $e");
    }
  }
}
