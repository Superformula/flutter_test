import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/domain/usecase/restaurant/restaurant_use_case.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantGateway restaurantGateway;
  final RestaurantUseCase restaurantUseCase;

  RestaurantProvider({required this.restaurantGateway})
      : restaurantUseCase = RestaurantUseCase(restaurantGateway: restaurantGateway);

  List<RestaurantEntity>? _restaurants = [];
  List<RestaurantEntity>? get restaurants => _restaurants;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _offset = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  Future<void> getRestaurants({int offset = 0}) async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await restaurantUseCase.fetchRestaurants(offset: offset);
      if (result == null || result.isEmpty) {
        _hasMore = false;
      } else {
        if (offset == 0) {
          _restaurants = result;
        } else {
          _restaurants?.addAll(result);
        }
        _offset += result.length;
      }
    } catch (e) {
      _errorMessage = 'Error retrieving restaurants: $e';
      if (_offset == 0) _restaurants = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoreRestaurants() async {
    await getRestaurants(offset: _offset);
  }
}
