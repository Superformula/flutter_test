// coverage:ignore-file
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/infrastructure/helpers/mappers/restaurant.dart' as infrastructure;

class RestaurantMapper {
  static RestaurantEntity fromInfrastructure(infrastructure.Restaurant restaurant) {
    return RestaurantEntity(
      id: restaurant.id ?? '',
      name: restaurant.name ?? '',
      price: restaurant.price ?? '',
      rating: restaurant.rating ?? 0.0,
      photos: restaurant.photos ?? [],
      categories: restaurant.categories?.map((c) => Category(title: c.title ?? '')).toList() ?? [],
      hours: restaurant.hours?.map((h) => Hours(isOpenNow: h.isOpenNow ?? false)).toList() ?? [],
      reviews: restaurant.reviews
              ?.map(
                (r) => Review(
                  id: r.id ?? '',
                  rating: r.rating ?? 0,
                  text: r.text ?? '',
                  user: User(
                    id: r.user?.id ?? '',
                    imageUrl: r.user?.imageUrl ?? '',
                    name: r.user?.name ?? '',
                  ),
                ),
              )
              .toList() ??
          [],
      location: Location(formattedAddress: restaurant.location?.formattedAddress ?? ''),
    );
  }

  static infrastructure.Restaurant toInfrastructure(RestaurantEntity domain) {
    return infrastructure.Restaurant(
      id: domain.id,
      name: domain.name,
      price: domain.price,
      rating: domain.rating,
      photos: domain.photos,
      categories: domain.categories.map((c) => infrastructure.Category(title: c.title)).toList(),
      hours: domain.hours.map((h) => infrastructure.Hours(isOpenNow: h.isOpenNow)).toList(),
      reviews: domain.reviews
          .map(
            (r) => infrastructure.Review(
              id: r.id,
              rating: r.rating,
              text: r.text,
              user: infrastructure.User(
                id: r.user.id,
                imageUrl: r.user.imageUrl,
                name: r.user.name,
              ),
            ),
          )
          .toList(),
      location: infrastructure.Location(formattedAddress: domain.location.formattedAddress),
    );
  }
}

RestaurantEntity? restaurantDataToRestaurant(infrastructure.RestaurantQueryResult restaurantData, String id) {
  final restaurant = restaurantData.restaurants?.firstWhere(
    (restaurant) => restaurant.id == id,
  );
  return restaurant != null ? RestaurantMapper.fromInfrastructure(restaurant) : null;
}
