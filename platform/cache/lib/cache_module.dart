import 'package:cache/repository/cache_repository.dart';
import 'package:cache/repository/shared_prefs_cache_repository.dart';
import 'package:dependency_injection/domain/sf_injector.dart';
import 'package:dependency_injection/domain/sf_module_builder.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheModule implements SFModule {
  @override
  void registerProviders() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    SFInjector.instance.registerFactory<SFCacheManager>(
        () => SharedPrefsCacheReppository(pref: sharedPreferences));
  }

  @override
  Map<String, Widget Function(dynamic p1)> get routes => {};
}
