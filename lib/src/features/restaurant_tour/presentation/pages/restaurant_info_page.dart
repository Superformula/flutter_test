import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/view/restaurant_info_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantInfoPage extends StatefulWidget {
  const RestaurantInfoPage({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantInfoPage> createState() => _RestaurantInfoPageState();
}

class _RestaurantInfoPageState extends State<RestaurantInfoPage> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final favoriteRestaurant = await SharedPreferences.getInstance();
    final isFavorite =
        favoriteRestaurant.getBool(widget.restaurant.id ?? '') ?? false;
    setState(() {
      _isFavorite = isFavorite;
    });
  }

  Future<void> _toggleFavorite() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = !_isFavorite;
    });
    await preferences.setBool(widget.restaurant.id ?? '', _isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_outline,
              ),
              onPressed: () => _toggleFavorite(),
              iconSize: 30,
            ),
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 30,
          ),
          title: Text(widget.restaurant.name ?? ''),
        ),
        body: RestaurantInfoView(
          restaurant: widget.restaurant,
        ),
      ),
    );
  }
}
