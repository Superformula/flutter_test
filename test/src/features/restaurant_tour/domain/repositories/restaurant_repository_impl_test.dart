import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/domain/datasources/restaurants_datasource.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/infrastructure/repositories/restaurant_repository_impl.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';

class MockRestaurantsDataSource extends Mock implements RestaurantsDatasource {}

void main() {
  group(
    'RestaurantRepositoryImpl tests',
    () {
      late RestaurantRepositoryImpl restaurantRepositoryImpl;
      late MockRestaurantsDataSource mockRestaurantsDataSource;

      setUp(() {
        mockRestaurantsDataSource = MockRestaurantsDataSource();
        restaurantRepositoryImpl =
            RestaurantRepositoryImpl(mockRestaurantsDataSource);
      });

      test('getRestaurants call datasource', () async {
        const restaurantsResponse =
            RestaurantQueryResult(restaurants: [], total: 0);
        when(() => mockRestaurantsDataSource.getRestaurants()).thenAnswer(
          (_) => Future.value(restaurantsResponse),
        );
        final result = await restaurantRepositoryImpl.getRestaurants();
        expect(result.restaurants, restaurantsResponse.restaurants);
      });
    },
  );
}
