import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import '../repositories/yelp_repository.dart';

import 'package:flutter/foundation.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'dart:async';

class YelpListViewModel extends ChangeNotifier {
  final YelpRepository _repository;
  List<Restaurant> _restaurants = [];
  bool _isLoading = false;
  bool _hasFetched = false;

  YelpListViewModel({YelpRepository? repository})
      : _repository = repository ?? YelpRepository(); // Allow passing mock repository

  List<Restaurant> get restaurants => _restaurants;
  bool get isLoading => _isLoading;
  bool get hasFetched => _hasFetched;

  Future<void> fetchYelpItems({bool forceRefresh = false}) async {
    if (_isLoading || (_hasFetched && !forceRefresh)) {
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

  void setRestaurants(List<Restaurant> restaurants) {
    _restaurants = restaurants;
    _isLoading = false;
    notifyListeners();
  }
}
