import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Favorites'),
          ElevatedButton(
            child: const Text('Favorites'),
            onPressed: () async {
              // final yelpRepo = YelpRepository();

              try {
                // final result = await yelpRepo.getRestaurants();
                // if (result != null) {
                //   print(
                //     'Fetched ${result.restaurants!.length} restaurants',
                //   );
                // } else {
                //   print('No restaurants fetched');
                // }
              } catch (e) {
                print('Failed to fetch restaurants: $e');
              }
            },
          ),
        ],
      ),
    );
  }
}
