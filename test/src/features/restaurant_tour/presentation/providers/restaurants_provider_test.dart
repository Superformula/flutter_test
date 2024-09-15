import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/data/mock.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/domain/repositories/restaurant_repository.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/providers/restaurants_provider.dart';

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  group('RestaurantNotifier', () {
    late MockRestaurantRepository mockRepository;

    setUp(() {
      mockRepository = MockRestaurantRepository();
    });
    test('currentCoffeeImageProvider returns correct CoffeeResponse', () {
      var response = mockQueryResult;

      final container = ProviderContainer(
        overrides: [],
      );

      container.read(getRestaurantsProvider);

      expect(mockQueryResult, response);
    });

    test('load restaurants correctly', () async {
      final notifier = RestaurantsNotifier(
        restaurantsCallBack: () {
          return Future.value(mockQueryResult);
        },
      );
      final response = mockQueryResult;
      when(() => mockRepository.getRestaurants())
          .thenAnswer((_) => Future.value(response));
      await notifier.loadRestaurants();

      expect(notifier.state, response);
    });

    test('get favorite restaurants correctly', () async {
      final notifier = RestaurantsNotifier(
        restaurantsCallBack: () {
          return Future.value(mockQueryResult);
        },
      );
      final response = mockQueryResult;
      when(() => mockRepository.getRestaurants())
          .thenAnswer((_) => Future.value(response));
      var favorite = notifier.getFavoriteRestaurants('100');

      expect(notifier.state.restaurants, favorite);
    });
  });
}
