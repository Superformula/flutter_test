import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/data/dtos/restaurant_dto.dart';
import 'package:restaurant_tour/data/repositories/cached_response.dart';

void main() {
  testWidgets('RestaurantDto fromJson should return an instance',
      (tester) async {
    final restaurantDto =
        RestaurantDto.fromJson(cachedResponse['data']['search']);

    expect(restaurantDto, isA<RestaurantDto>());
  });

  testWidgets('RestaurantDto toJson should return a map', (tester) async {
    final restaurantDto =
        RestaurantDto.fromJson(cachedResponse['data']['search']);

    final map = restaurantDto.toJson();

    expect(map, isA<Map>());
  });
}
