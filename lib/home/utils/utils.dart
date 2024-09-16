import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/restaurant.dart';
import '../services/module_communication_interface.dart';

class Utils {
  static Future<String> readJson() async {
    String response =
        await rootBundle.loadString('assets/json/graphql_response.json');
    return response;
  }

  static ImageProvider? getImageProvider(String avatar) {
    final defaultImage = Image.asset(
      'assets/images/user.png',
    ).image;

    final avatarUrl = Uri.parse(avatar);

    if (!avatarUrl.hasAbsolutePath) {
      return defaultImage;
    }

    return avatar != '' ? NetworkImage(avatar) : defaultImage;
  }

  static getFavoritiesRestaurants(
    ModuleCommunicationInterface communication,
  ) async {
    return communication.get(KeyStorage.favorities);
  }

  static addFavorityRestaurant(
    ModuleCommunicationInterface communication,
    String id,
  ) async {
    List<String> favorities = await getFavoritiesRestaurants(communication);
    favorities.add(id);
    await communication.put(KeyStorage.favorities, favorities);
  }

  static removeFavorityRestaurant(
    ModuleCommunicationInterface communication,
    String id,
  ) async {
    List<String> favorities = await getFavoritiesRestaurants(communication);
    favorities.removeWhere((item) => item == id);
    await communication.put(KeyStorage.favorities, favorities);
  }

  static Future<bool> findFavorityRestaurant(
    ModuleCommunicationInterface communication,
    String id,
  ) async {
    List<String> favorities = await getFavoritiesRestaurants(communication);
    return favorities.where((item) => item == id).isNotEmpty;
  }

  static Future<List<Restaurant>> favoritiesRestaurants(
    ModuleCommunicationInterface communication,
    List<Restaurant> restaurants,
  ) async {
    List<String> favorities = await getFavoritiesRestaurants(communication);
    List<Restaurant> filterList = restaurants
        .toSet()
        .where((element) => favorities.toSet().contains(element.id))
        .toList();
    return filterList;
  }
}
