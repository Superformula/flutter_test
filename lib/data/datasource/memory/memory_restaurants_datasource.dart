import 'dart:math';

import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class MemoryRestaurantsDatasource implements RestaurantsDatasource {
  var restaurants = List.generate(
      100,
      (i) => Restaurant(
            id: "restaurant_$i",
            name: "Amazing Pizza ${i + 1}",
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
      growable: true);

  @override
  Future<List<Restaurant>> getRestaurants(
      {int offset = 0, int limit = 10}) async {
    final result = restaurants.sublist(offset, offset + limit);
    return Future.value(result);
  }
}
