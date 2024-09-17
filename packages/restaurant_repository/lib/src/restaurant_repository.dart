import 'dart:convert';

import 'package:restaurant_gql_client/restaurant_gql_client.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template fetch_restaurants_exception}
/// Exception thrown when fetching restaurants fails.
/// {@endtemplate}
class FetchRestaurantsException implements Exception {
  /// {@macro fetch_restaurants_exception}
  FetchRestaurantsException([this.message]);

  /// The error message for the exception.
  final String? message;

  @override
  String toString() => 'FetchRestaurantsException: $message';
}

/// {@template save_favorite_restaurant_exception}
/// Exception thrown when saving a restaurant to favorites fails.
/// {@endtemplate}
class SaveFavoriteRestaurantException implements Exception {
  /// {@macro save_favorite_restaurant_exception}
  SaveFavoriteRestaurantException([this.message]);

  /// The error message for the exception.
  final String? message;

  @override
  String toString() => 'SaveFavoriteRestaurantException: $message';
}

/// {@template delete_favorite_restaurant_exception}
/// Exception thrown when deleting a restaurant from favorites fails.
/// {@endtemplate}
class DeleteFavoriteRestaurantException implements Exception {
  /// {@macro delete_favorite_restaurant_exception}
  DeleteFavoriteRestaurantException([this.message]);

  /// The error message for the exception.
  final String? message;

  @override
  String toString() => 'DeleteFavoriteRestaurantException: $message';
}

/// {@template restaurant_repository}
/// A repository for managing restaurant data and user preferences.
///
/// This repository handles both the fetching of restaurant data from the
/// GraphQL
/// API and the management of favorite restaurants locally via
/// `SharedPreferences`.
///
/// It provides methods to:
/// - Fetch restaurant data.
/// - Save, retrieve, and delete favorite restaurants.
/// - Check if a specific restaurant is marked as a favorite.
/// {@endtemplate}
class RestaurantRepository {
  /// {@macro restaurant_repository}
  const RestaurantRepository(
    RestaurantGqlClient restaurantGqlClient,
    SharedPreferences sharedPreferences,
  )   : _restaurantGqlClient = restaurantGqlClient,
        _sharedPreferences = sharedPreferences;

  /// Key used for storing favorite restaurants in shared preferences.
  static const String favoriteRestaurants = 'favoriteRestaurants';

  final RestaurantGqlClient _restaurantGqlClient;
  final SharedPreferences _sharedPreferences;

  /// Checks if a restaurant is marked as a favorite.
  ///
  /// Takes the restaurant's [id] and checks against the stored favorites.
  ///
  /// Returns `true` if the restaurant is a favorite, otherwise `false`.
  ///
  /// Throws a [FetchRestaurantsException] if fetching favorite restaurants
  /// fails.
  Future<bool> isFavorite(String id) async {
    try {
      final favorites = await fetchFavoriteRestaurants();
      return favorites.any((restaurant) => restaurant.id == id);
    } catch (error) {
      throw FetchRestaurantsException(
        'Failed to check if restaurant is favorite: $error',
      );
    }
  }

  /// Saves a restaurant to the list of favorite restaurants.
  ///
  /// Takes a [restaurant] and adds it to the stored favorites.
  ///
  /// Throws a [SaveFavoriteRestaurantException] if saving fails.
  Future<void> saveFavoriteRestaurant(Restaurant restaurant) async {
    try {
      final favorites = await fetchFavoriteRestaurants();
      final newFavorites = List<Restaurant>.from(favorites)..add(restaurant);
      final encoded =
          newFavorites.map((value) => jsonEncode(value.toJson())).toList();
      await _sharedPreferences.setStringList(favoriteRestaurants, encoded);
    } catch (error) {
      throw SaveFavoriteRestaurantException(
        'Failed to save favorite restaurant: $error',
      );
    }
  }

  /// Deletes a restaurant from the list of favorite restaurants.
  ///
  /// Takes a [restaurant] and removes it from the stored favorites.
  ///
  /// Throws a [DeleteFavoriteRestaurantException] if deletion fails.
  Future<void> deleteFavoriteRestaurant(Restaurant restaurant) async {
    try {
      final favorites = await fetchFavoriteRestaurants();
      final newFavorites = List<Restaurant>.from(favorites)
        ..removeWhere((element) => element.id == restaurant.id);
      final encoded =
          newFavorites.map((value) => jsonEncode(value.toJson())).toList();
      await _sharedPreferences.setStringList(favoriteRestaurants, encoded);
    } catch (error) {
      throw DeleteFavoriteRestaurantException(
        'Failed to delete favorite restaurant: $error',
      );
    }
  }

  /// Fetches the list of favorite restaurants from local storage.
  ///
  /// Returns a list of [Restaurant] objects that are marked as favorites.
  ///
  /// Throws a [FetchRestaurantsException] if fetching favorites fails.
  Future<List<Restaurant>> fetchFavoriteRestaurants() async {
    try {
      final jsonList =
          _sharedPreferences.getStringList(favoriteRestaurants) ?? [];

      return jsonList
          .map(
            (e) => Restaurant.fromJson(jsonDecode(e) as Map<String, dynamic>),
          )
          .toList();
    } catch (error) {
      throw FetchRestaurantsException(
        'Failed to fetch favorite restaurants: $error',
      );
    }
  }

  /// Fetches a list of restaurants from the GraphQL API.
  ///
  /// Takes an optional [offset] to paginate results.
  ///
  /// Returns a [RestaurantQueryResult] containing the fetched restaurants.
  ///
  /// Throws a [FetchRestaurantsException] if the API request fails.
  Future<RestaurantQueryResult?> fetchRestaurants({int offset = 0}) async {
    try {
      final response =
          await _restaurantGqlClient.getRestaurants(offset: offset);
      return response;
    } catch (error) {
      throw FetchRestaurantsException('Failed to fetch restaurants: $error');
    }
  }
}
