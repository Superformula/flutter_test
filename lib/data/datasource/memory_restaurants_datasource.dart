import 'package:restaurant_tour/common/exceptions/exceptions.dart';
import 'package:restaurant_tour/domain/datasource/restaurants_datasource.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class MemoryRestaurantsDatasource implements RestaurantsDatasource {
  List<Restaurant> restaurants = [
    Restaurant(
      id: "restaurant_1",
      name: "Amazing Pizza",
      price: "\$15-\$20",
      rating: 4.8,
      photos: ["https://example.com/pizza.jpg"],
      categories: [Category(title: "Italian")],
      hours: [const Hours(isOpenNow: true)],
      location: Location(formattedAddress: "123 Main St, Anytown, CA"),
    ),
    Restaurant(
      id: "restaurant_2",
      name: "Cozy Sushi",
      price: "\$20-\$30",
      rating: 4.7,
      photos: ["https://example.com/sushi.jpg"],
      categories: [Category(title: "Japanese")],
      hours: [const Hours(isOpenNow: false)],
      location: Location(formattedAddress: "456 Elm St, Anytown, CA"),
    ),
    Restaurant(
      id: "restaurant_3",
      name: "Burger Barn",
      price: "\$10-\$15",
      rating: 4.2,
      photos: ["https://example.com/burger.jpg"],
      categories: [Category(title: "American")],
      hours: [const Hours(isOpenNow: true)],
      location: Location(formattedAddress: "789 Maple St, Anytown, CA"),
    ),
    Restaurant(
      id: "restaurant_4",
      name: "Healthy Bowls",
      price: "\$12-\$18",
      rating: 4.9,
      photos: ["https://example.com/salad.jpg"],
      categories: [Category(title: "Healthy")],
      hours: [const Hours(isOpenNow: false)],
      location: Location(formattedAddress: "1011 Oak St, Anytown, CA"),
    ),
    Restaurant(
      id: "restaurant_5",
      name: "Taco Fiesta",
      price: "\$8-\$12",
      rating: 4.5,
      photos: ["https://example.com/tacos.jpg"],
      categories: [Category(title: "Mexican")],
      hours: [const Hours(isOpenNow: true)],
      location: Location(formattedAddress: "1234 Pine St, Anytown, CA"),
    ),
  ];
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
