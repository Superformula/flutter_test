import 'dart:math';

import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class MemoryRestaurantsDatasource implements RestaurantsDatasource {
  final restaurants = [1, 2, 3, 4, 5]
      .map(
        (e) => Restaurant(
          id: "restaurant_$e",
          name: "Amazing Pizza",
          price: "\$\$\$",
          rating: 4.8,
          photos: ["https://picsum.photos/361/360"],
          categories: [Category(alias: 'demo', title: 'Italian')],
          hours: [const Hours(isOpenNow: true)],
          location: Location(formattedAddress: "123 Main St, Anytown, CA"),
          reviews: [1, 2, 3, 4, 5, 6]
              .map((e) => const Review(
                    id: 'review_id',
                    text:
                        'Review text goes here. Review text goes here. This is a review. This is a review that is 3 lines long.',
                    rating: 5,
                    user: const User(
                      id: 'user_id',
                      imageUrl: 'https://picsum.photos/200/300',
                      name: 'Test User',
                    ),
                  ))
              .toList(),
        ),
      )
      .toList();
  @override
  Future<Restaurant> getRestaurant(String id) {
    try {
      return Future.value(
        restaurants.where((restaurant) => restaurant.id == id).first,
      );
    } on StateError {
      throw RestaurantNotFoundException();
    }
  }

  @override
  Future<List<Restaurant>> getRestaurants({
    List<String> filterByIds = const [],
  }) {
    return Future.value(
      filterByIds.isEmpty
          ? restaurants
          : restaurants
              .where((restaurant) => filterByIds.contains(restaurant.id))
              .toList(),
    );
  }
}
