import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:restaurant_tour/data/datasources/local/provider/base_database_provider.dart';
import 'package:restaurant_tour/data/datasources/local/restaurant_local_data_source.dart';
import 'package:restaurant_tour/data/datasources/remote/restaurant_remote_data_source.dart';
import 'package:restaurant_tour/data/repositories/mock/mocked_cached_response.dart';
import 'package:restaurant_tour/data/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

import '../../fakes/data/fake_database_provider.dart';

void main() {
  late RestaurantsRepository restaurantsRepository;
  late Dio httpClient;
  late DioAdapter dioAdapter;
  late BaseDatabaseProvider databaseProvider;

  const route = 'https://example.com';

  setUp(() async {
    httpClient = Dio(BaseOptions(baseUrl: route));
    dioAdapter = DioAdapter(
      dio: httpClient,
      matcher: const UrlRequestMatcher(),
    );
    databaseProvider = FakeDatabaseProvider();
    await databaseProvider.init();

    restaurantsRepository = RestaurantsRepository(
      remoteDataSource: RestaurantRemoteDataSource(httpClient: httpClient),
      localDataSource: RestaurantLocalDataSource(
        databaseProvider: databaseProvider,
      ),
    );
  });

  tearDownAll(() {
    databaseProvider.close();
    restaurantsRepository.dispose();
  });

  test('should return a list of restaurants', () async {
    dioAdapter.onPost(
      '/v3/graphql',
      (server) => server.reply(
        200,
        cachedResponse,
        delay: const Duration(seconds: 1),
      ),
      data: null,
    );

    final data = await restaurantsRepository.getRestaurants();

    expect(data.tryGetSuccess()?.length, 20);
  });

  test('should return favorite restaurants', () async {
    const restaurant = Restaurant(id: 'test');
    restaurantsRepository.toggleFavorite(restaurant);

    await pumpEventQueue();

    expectLater(
      restaurantsRepository.getFavorites(),
      emitsInOrder([
        [restaurant],
      ]),
    );
  });
}
