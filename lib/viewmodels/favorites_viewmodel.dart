import 'package:flutter/material.dart';
import 'package:restaurant_tour/database/db_helper.dart';
import '../models/restaurant.dart';
import '../repositories/yelp_repository.dart';

class FavoritesViewModel extends ChangeNotifier {
  late DBHelper _dbHelper;
  late YelpRepository _yelpRepository;
  List<Restaurant> _favoriteRestaurants = [];
  bool _isLoading = false;
  final Map<String, Restaurant> _restaurantCache = {};
  final Set<String> _attemptedIds = {};

  FavoritesViewModel({DBHelper? dbHelper, YelpRepository? yelpRepository}) {
    _dbHelper = dbHelper ?? DBHelper();
    _yelpRepository = yelpRepository ?? YelpRepository();
  }

  List<Restaurant> get favoriteRestaurants => _favoriteRestaurants;
  bool get isLoading => _isLoading;

  // Fetch favorite restaurants from DB and Yelp API
  Future<void> fetchFavorites() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final favoriteIds = await _dbHelper.getFavorites();

      if (favoriteIds.isNotEmpty) {
        final cachedRestaurants = favoriteIds.where((id) => _restaurantCache.containsKey(id)).map((id) => _restaurantCache[id]!).toList();
        final uncachedIds = favoriteIds.where((id) => !_attemptedIds.contains(id)).toList(); // Only fetch if not attempted

        if (uncachedIds.isNotEmpty) {
          final fetchedRestaurants = await _yelpRepository.getRestaurantsByIds(uncachedIds);
          if (fetchedRestaurants != null) {
            _favoriteRestaurants = [...cachedRestaurants, ...fetchedRestaurants];
            for (var restaurant in fetchedRestaurants) {
              _restaurantCache[restaurant.id!] = restaurant;
              _attemptedIds.add(restaurant.id!);
            }
          } else {
            _favoriteRestaurants = cachedRestaurants;
          }
        } else {
          _favoriteRestaurants = cachedRestaurants;
        }
      }
    } catch (e) {
      print('Error fetching favorite restaurants: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addFavorite(String restaurantId) async {
    await _dbHelper.insertFavorite(restaurantId);

    if (_restaurantCache.containsKey(restaurantId) || _attemptedIds.contains(restaurantId)) {
      _favoriteRestaurants.add(_restaurantCache[restaurantId]!);
    } else {
      final fetchedRestaurants = await _yelpRepository.getRestaurantsByIds([restaurantId]);
      if (fetchedRestaurants != null && fetchedRestaurants.isNotEmpty) {
        final restaurant = fetchedRestaurants.first;
        _favoriteRestaurants.add(restaurant);
        _restaurantCache[restaurant.id!] = restaurant;
        _attemptedIds.add(restaurant.id!);
      }
    }

    notifyListeners();
  }

  Future<void> removeFavorite(String restaurantId) async {
    await _dbHelper.deleteFavorite(restaurantId);
    _favoriteRestaurants.removeWhere((restaurant) => restaurant.id == restaurantId);
    notifyListeners();
  }

  Future<bool> isFavorite(String restaurantId) async {
    return _dbHelper.isFavorite(restaurantId);
  }

  void setDbHelper(DBHelper dbHelper) {
    _dbHelper = dbHelper;
  }

  void setYelpRepository(YelpRepository yelpRepository) {
    _yelpRepository = yelpRepository;
  }
}
