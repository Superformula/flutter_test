import 'package:dependency_injection/repository/sf_injector_get_it.dart';
import 'package:flutter/material.dart';

abstract class SFInjector {
  static final SFInjector _instance = SFInjectorGetIt();
  static SFInjector get instance => _instance;

  /// registers a type as Singleton by passing a factory function that will be called
  /// on the first call of [get] on that type
  /// [T] type to register
  /// [factoryFunc] factory function for this type
  /// [instanceName] if you provide a value here your factory gets registered with that
  /// name instead of a type. This should only be necessary if you need to register more
  /// than one instance of one type. Its highly not recommended
  /// [registerLazySingleton] does not influence allReady however you can wait
  /// for and be dependent on a LazySingleton.
  /// Example:
  ///
  /// ```SFInjector.instance.registerLazySingleton(() => DHModuleExampleLazySingleton());```
  void registerLazySingleton<T extends Object>(T Function() factoryFunc,
      {String? instanceName});

  /// registers a type as Singleton by passing an [instance] of that type
  /// that will be returned on each call of [get] on that type
  /// [T] type to register
  /// [instanceName] if you provide a value here your instance gets registered with that
  /// name instead of a type. This should only be necessary if you need to register more
  /// than one instance of one type. Its highly not recommended
  /// If signalsReady is set to `true` it means that the future you can get from `allReady()`
  /// cannot complete until this this instance was signalled ready by calling
  /// [signalsReady(instance)].
  /// Example:
  ///
  /// ```SFInjector.instance.registerSingleton(DHModuleExampleSingleton())```
  void registerSingleton<T extends Object>(T instance, {String? instanceName});

  /// registers a type so that a new instance will be created on each call of [get] on that type
  /// [T] type to register
  /// [factoryFunc] factory function for this type
  /// [instanceName] if you provide a value here your factory gets registered with that
  /// name instead of a type. This should only be necessary if you need to register more
  /// than one instance of one type. Its highly not recommended
  /// Example:
  ///
  /// ```SFInjector.instance.registerFactory(() => DHModuleExampleFactory())```
  void registerFactory<T extends Object>(T Function() factoryFunc,
      {String? instanceName});

  /// retrieves or creates an instance of a registered type [T] depending on the registration
  /// function used for this type or based on a name.
  /// Example:
  ///
  /// ```SFInjector.instance.get<DHModuleExampleSingleton>()```
  T get<T extends Object>({String? instanceName});

  /// get or registers an instance of a registered type [T]
  /// [T] type to register
  /// [factoryFunc] factory function for this type
  ///
  /// ```SFInjector.instance.getOrRegister<DHModuleExampleSingleton>(() => DHModuleExampleFactory(), DHModuleExampleSingleton)```
  T getOrRegister<T extends Object>(T factoryFunc);

  /// check if it exists instance of a registered type [T] depending on the registration
  /// function used for this type or based on a name.
  /// Example:
  ///
  /// ```SFInjector.instance.exists<DHModuleExampleExists>()```
  bool exists<T extends Object>({String? instanceName});

  /// Unregister an [instance] of an object or a factory/singleton by Type [T] or by name [instanceName]
  /// Example:
  ///
  /// ```SFInjector.instance.unregister<DHModuleExampleUnregister>()```
  Future<void> unregister<T extends Object>({String? instanceName});

  /// Clear all registered instances
  @visibleForTesting
  Future<void> reset();
}
