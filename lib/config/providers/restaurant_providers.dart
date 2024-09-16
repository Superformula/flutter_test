import 'package:flutter/material.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/domain/usecase/restaurant/restaurant_use_case.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantGateway restaurantGateway;
  final RestaurantUseCase restaurantUseCase;

  RestaurantProvider({required this.restaurantGateway})
      : restaurantUseCase = RestaurantUseCase(restaurantGateway: restaurantGateway);

  List<RestaurantEntity>? _restaurants;
  List<RestaurantEntity>? get restaurants => _restaurants;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getRestaurants() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await restaurantUseCase.fetchRestaurants();
      _restaurants = result;
    } catch (e) {
      _errorMessage = 'Error al obtener los restaurantes: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
