import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/constants/strings.dart';
import 'package:restaurant_tour/src/constants/typography.dart';
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

  _showToast() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite ? restaurantAddedText : restaurantDeletedText,
          style: AppTextStyles.openRegularHeadline.copyWith(
            color: Colors.white,
          ),
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black,
      ),
    );
  }

  Future<void> _toggleFavorite() async {
    final preferences = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = !_isFavorite;
      _showToast();
    });
    await preferences.setBool(widget.restaurant.id ?? '', _isFavorite);
    if (!_isFavorite && mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pop(
              context,
              false,
            );
          },
          iconSize: 30,
        ),
        title: Text(widget.restaurant.name ?? ''),
      ),
      body: RestaurantInfoView(
        restaurant: widget.restaurant,
      ),
    );
  }
}
