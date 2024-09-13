import 'package:flutter/material.dart';

class FavoriteRestaurantsView extends StatefulWidget {
  const FavoriteRestaurantsView({super.key});

  @override
  State<FavoriteRestaurantsView> createState() =>
      _FavoriteRestaurantsViewState();
}

class _FavoriteRestaurantsViewState extends State<FavoriteRestaurantsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          'My favorites view',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
