import 'package:cache/repository/cache_repository.dart';
import 'package:cache/repository/shared_prefs_cache_repository.dart';
import 'package:dependency_injection/domain/sf_injector.dart';
import 'package:dependency_injection/domain/sf_module_builder.dart';
import 'package:flutter/widgets.dart';

class CacheModule implements SFModule {
  @override
  void registerProviders() {
    SFInjector.instance
        .registerFactory<SFCacheManager>(() => SharedPrefsCacheReppository());
  }

  @override
  Map<String, Widget Function(dynamic p1)> get routes => {};
}
