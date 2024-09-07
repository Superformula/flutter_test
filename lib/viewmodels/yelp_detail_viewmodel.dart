import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';

class YelpDetailViewModel extends ChangeNotifier {
  Restaurant? _selectedRestaurant;

  Restaurant? get selectedRestaurant => _selectedRestaurant;

  void selectRestaurant(Restaurant restaurant) {
    _selectedRestaurant = restaurant;
    notifyListeners();
  }

  void clearSelection() {
    _selectedRestaurant = null;
    notifyListeners();
  }
}