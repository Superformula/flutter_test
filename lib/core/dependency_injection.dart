import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/core/utils/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._internal();

  static const String _apiKey =
      'SJWsWG4DEbZIZpnWNxc9K3Es9C2o27Vqpl-v5kNT-ZkYTmKB6ffnjo9Mzg6N0uHgFdJNOYVynd3kWso-tTrVMwpz2gIROLO-BlPdWcZkKKTA7cUr_tiVy5Dry3XjZnYx';

  factory DependencyInjection() {
    return _singleton;
  }

  DependencyInjection._internal();

  void init() async {
    //Core
    getIt.registerLazySingleton<StorageInterface>(
      () => Storage(
        getIt.get<SharedPreferences>(),
      ),
    );

    //External
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    getIt.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://api.yelp.com',
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Content-Type': 'application/graphql',
          },
        ),
      ),
    );
  }
}
