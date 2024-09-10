import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  FavoritesNotifier() : super([]) {
    _loadFavorites();
  }

  // Load the favorites from SharedPreferences when the app starts
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteListJson = prefs.getString('favoriteRestaurants');

    if (favoriteListJson == null || favoriteListJson.isEmpty) {
      state = [];
      return;
    }

    try {
      final List<dynamic> jsonList = jsonDecode(favoriteListJson) as List<dynamic>;
      state = jsonList.map((json) => Restaurant.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      print('Error deserializing favorites: $e');
      state = [];
    }
  }

  // Save the updated favorites list to SharedPreferences
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> jsonList = state.map((restaurant) => restaurant.toJson()).toList();
    final String jsonString = jsonEncode(jsonList);

    await prefs.setString('favoriteRestaurants', jsonString);
  }

  // Add or remove a restaurant from the favorites list
  void toggleFavorite(Restaurant restaurant) {
    if (state.any((r) => r.id == restaurant.id)) {
      removeFavorite(restaurant);
    } else {
      addFavorite(restaurant);
    }
  }

  // Add a restaurant to favorites
  void addFavorite(Restaurant restaurant) {
    state = [...state, restaurant];
    _saveFavorites();
  }

  // Remove a restaurant from favorites
  void removeFavorite(Restaurant restaurant) {
    state = state.where((r) => r.id != restaurant.id).toList();
    _saveFavorites();
  }
}

// Create a provider for the favorites list
final favoritesListProvider = StateNotifierProvider<FavoritesNotifier, List<Restaurant>>((ref) {
  return FavoritesNotifier();
});