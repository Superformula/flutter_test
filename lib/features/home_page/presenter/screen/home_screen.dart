import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Restaurant Tour'),
            ElevatedButton(
              onPressed: () async {
                final yelpRepo = YelpRepository();
                try {
                  final result = await yelpRepo.getRestaurants();
                  if(result != null) {
                    debugPrint('Fetched ${result.restaurants!.length} restaurants');
                  } else {
                    debugPrint('No restaurants fetched');
                  }
                } catch (e) {
                  debugPrint('Failed to fetch restaurants: $e');
                }
              },
              child: const Text('Fetch Restaurants'),
            ),
          ],
        ),
      ),
    );
  }
}
