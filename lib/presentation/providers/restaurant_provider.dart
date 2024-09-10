import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/yelp_repository.dart'; // Import your repository
import '../../models/restaurant.dart';

// Provider that returns a list of Restaurants
final restaurantListProvider = FutureProvider<List<Restaurant>>((ref) async {

  final yelpRepo = YelpRepository();
  final result = await yelpRepo.getRestaurants();
  if (result != null) {
    print('Fetched ${result.restaurants!.length} restaurants');
    List<Restaurant> restaurants = List<Restaurant>.from(result.restaurants!);
    return restaurants;
  } else {
    print('No restaurants fetched');
    return [];
  }
});

// StateNotifier for managing favorites list
class FavoritesNotifier extends StateNotifier<List<Restaurant>> {
  FavoritesNotifier() : super([]);

  // Add or remove a restaurant from the favorites list
  void toggleFavorite(Restaurant restaurant) {
    // Check if the restaurant is already in the list
    if (state.any((r) => r.id == restaurant.id)) {
      // If restaurant is already in the list, remove it
      removeFavorite(restaurant);
    } else {
      // If not in the list, add it
      addFavorite(restaurant);
    }
  }

  // Add a restaurant to favorites
  void addFavorite(Restaurant restaurant) {
    state = [...state, restaurant];  // Add restaurant to the list
  }

  // Remove a restaurant from favorites
  void removeFavorite(Restaurant restaurant) {
    state = state.where((r) => r.id != restaurant.id).toList();  // Remove restaurant by id
  }
}

// Create a provider for the favorites list
final favoritesListProvider = StateNotifierProvider<FavoritesNotifier, List<Restaurant>>((ref) {
  return FavoritesNotifier();
});

/*List<Restaurant> list = [];

  Restaurant a = Restaurant(
      id: '1',
      name: 'restaurant a',
      price: 'price',
      rating: 3.6,
      photos: [
        'https://media.cntraveler.com/photos/654bd5e13892537a8ded0947/master/pass/phy2023.din.oss.restaurant-lr.jpg'
      ],
      categories: [
        Category(alias: 'italian', title: 'Italian'),
        Category(alias: 'pasta', title: 'Pasta')
      ],
      hours: [const Hours(isOpenNow: true)],
      reviews: [
        const Review(
            id: "sjZoO8wcK1NeGJFDk5i82Q",
            rating: 5,
            user: User(
              id: "BuBCkWFNT_O2dbSnBZvpoQ",
              imageUrl:
                  "https://s3-media2.fl.yelpcdn.com/photo/v8tbTjYaFvkzh1d7iE-pcQ/o.jpg",
              name: "Gina T.",
            ),
            text:
                "I love this place! The food is amazing and the service is great."),
        const Review(
          id: "okpO9hfpxQXssbTZTKq9hA",
          rating: 5,
          user: User(
            id: "0x9xu_b0Ct_6hG6jaxpztw",
            imageUrl:
                "https://s3-media3.fl.yelpcdn.com/photo/gjz8X6tqE3e4praK4HfCiA/o.jpg",
            name: "Crystal L.",
          ),
          text: "Greate place to eat",
        ),
      ],
      location: Location(
        formattedAddress: '102 Lakeside Ave Seattle, WA 98122',
      ),
  );
  Restaurant b = Restaurant(
    id: '2',
    name: 'restaurant b',
    price: 'price',
    rating: 2.4,
    photos: [
      'https://media.cntraveler.com/photos/6552541546a7d1d8bdf5122d/master/w_1600,c_limit/DSC00781%20copy.jpg'
    ],
    categories: [
      Category(alias: 'asian', title: 'Asian'),
      Category(alias: 'ramen', title: 'Ramen')
    ],
    hours: [const Hours(isOpenNow: false)],
    reviews: [
      const Review(
          id: "sjZoO8wcK1NeGJFDk5i82Q",
          rating: 5,
          user: User(
            id: "BuBCkWFNT_O2dbSnBZvpoQ",
            imageUrl:
                "https://s3-media2.fl.yelpcdn.com/photo/v8tbTjYaFvkzh1d7iE-pcQ/o.jpg",
            name: "Gina T.",
          ),
          text:
              "I love this place! The food is amazing and the service is great."),
      const Review(
        id: "okpO9hfpxQXssbTZTKq9hA",
        rating: 5,
        user: User(
          id: "0x9xu_b0Ct_6hG6jaxpztw",
          imageUrl:
              "https:///s3-media3.fl.yelpcdn.com/photo/gjz8X6tqE3e4praK4HfCiA/o.jpg",
          name: "Crystal L.",
        ),
        text: "Greate place to eat",
      ),
    ],
    location: Location(
      formattedAddress: '102 Lakeside Ave Seattle, WA 98122',
    ),
  );

  list.add(a);
  list.add(b);
  return list;*/