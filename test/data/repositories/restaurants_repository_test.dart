import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:restaurant_tour/data/repositories/mock/mocked_cached_response.dart';
import 'package:restaurant_tour/data/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';

void main() {
  late RestaurantsRepository restaurantsRepository;
  late Dio httpClient;
  late DioAdapter dioAdapter;

  const route = 'https://example.com';

  setUp(() {
    httpClient = Dio(BaseOptions(
      baseUrl: route,
    ));
    dioAdapter = DioAdapter(
      dio: httpClient,
      matcher: const UrlRequestMatcher(),
    );

    restaurantsRepository = RestaurantsRepository(httpClient: httpClient);
  });

  tearDownAll(() {
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

    expect(data?.length, 20);
  });

  test('should return favorite restaurants', () {
    const restaurant = Restaurant(id: 'test');
    restaurantsRepository.toggleFavorite(restaurant);

    expectLater(
      restaurantsRepository.getFavorites(),
      emitsInOrder([
        [restaurant]
      ]),
    );
  });
}
