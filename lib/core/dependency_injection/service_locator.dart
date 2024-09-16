import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_tour/core/http_service/http_client.dart';
import 'package:restaurant_tour/data/shared_services.dart';

import '../../data/repositories/yelp_dev_repository.dart';
import '../../data/repositories/yelp_prod_repository.dart';
import '../../data/repositories/yelp_repository.dart';
import '../flavors.dart';

final dependency = GetIt.instance;

void setupLocator({required Flavor flavor}) {
  dependency.registerLazySingleton<http.Client>(
    () => http.Client(),
  );

  dependency.registerLazySingleton<IHttpClient>(
    () => HttpClient(dependency<http.Client>()),
  );

  dependency.registerLazySingleton<SharedServices>(
    () => SharedServices(),
  );

  dependency.registerLazySingleton<YelpRepository>(
    () {
      if (flavor == Flavor.prod) {
        return YelpProdRepository(client: dependency<IHttpClient>());
      }

      return YelpDevRepository(client: dependency<IHttpClient>());
    },
  );
}
