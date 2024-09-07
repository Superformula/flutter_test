import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import '../repositories/yelp_repository.dart';

class YelpListViewModel extends ChangeNotifier {
  final YelpRepository _repository = YelpRepository();
  List<Restaurant> _restaurants = [];
  bool _isLoading = false;
  bool _hasFetched = false;

  List<Restaurant> get restaurants => _restaurants;
  bool get isLoading => _isLoading;

  Future<void> fetchYelpItems({bool forceRefresh = false}) async {
    if (_isLoading || (_hasFetched && !forceRefresh)) {
      // Skip if a request is already in progress or data is already fetched
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      final result = await _repository.getRestaurants();
      if (result != null) {
        _restaurants = result.restaurants!;
        _hasFetched = true;
      }
    } catch (e) {
      _hasFetched = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshYelpItems() async {
    await fetchYelpItems(forceRefresh: true);
  }

  void debounceFetch() {
    fetchYelpItems();
  }
}
