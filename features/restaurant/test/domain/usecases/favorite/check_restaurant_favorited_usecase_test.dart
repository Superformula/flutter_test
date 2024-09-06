import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/domain/repository/favorites/favorite_restaurant_repository.dart';
import 'package:restaurant/domain/usecases/favorite/check_restaurant_favorited_usecase.dart';

import '../../../mocks/server_responses.dart';

class FavoriteRestaurantRepositoryMock extends Mock
    implements FavoriteRestaurantRepository {}

void main() {
  var mockRepo = FavoriteRestaurantRepositoryMock();

  RestaurantQueryResult restaurantsQuery =
      RestaurantQueryResult.fromJson(response['data']['search']);
  setUpAll(() {
    when(() => mockRepo.getFavoriteRestaurants())
        .thenAnswer((invocation) => Future.value(restaurantsQuery.restaurants));
    SFInjector.instance
        .registerFactory<FavoriteRestaurantRepository>(() => mockRepo);
  });

  test('Given a restaurant when it is on list then return true', () async {
    var sut = CheckRestaurantFavoritedUseCase();
    var isFavorite = await sut.isFavorited(restaurantsQuery.restaurants.first);
    expect(isFavorite, true);
  });

  test('Given a restaurant when it is not in list then return false', () async {
    var sut = CheckRestaurantFavoritedUseCase();
    var notFavoriteRestaurant = RestaurantQueryResult.fromJson({
      "total": 5056,
      "business": [mockedRestaurant()]
    });
    var isFavorite =
        await sut.isFavorited(notFavoriteRestaurant.restaurants.first);
    expect(isFavorite, false);
  });
}
