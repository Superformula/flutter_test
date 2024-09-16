import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/restaurant.dart';

class SharedServices {
  static SharedPreferences? _preferences;

  static Future<void> _getPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> saveListString(
    String key,
    List<Restaurant> restaurantList,
  ) async {
    await _getPreferences();

    List<String> encodedList = restaurantList
        .map((restaurant) => jsonEncode(restaurant.toJson()))
        .toList();

    await _preferences!.setStringList(key, encodedList);
  }

  Future<List<Restaurant>> getListString(String key) async {
    await _getPreferences();

    final jsonList = _preferences!.getStringList(key) ?? [];

    return jsonList.map((e) => Restaurant.fromJson(json.decode(e))).toList();
  }
}

class SharedPreferencesKeys {
  static String savedRestaurants = 'savedRestaurants';
}
