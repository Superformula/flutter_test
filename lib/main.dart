import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Logger.root.onRecord.listen((record) {
        debugPrint('${record.level.name}: ${record.time}: ${record.message}');
      });

      runApp(const RestaurantTourApp());
    },
    (error, stackTrace) {
      Logger.root.severe('The app has experienced a crash.', error, stackTrace);
    },
  );
}

final class RestaurantTourApp extends StatelessWidget {
  const RestaurantTourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Tour',
      home: HomePage(),
    );
  }
}

final class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Restaurant Tour'),
            ElevatedButton(
              child: const Text('Fetch Restaurants'),
              onPressed: () async {
                final yelpRepo = YelpRepository();

                try {
                  final result = await yelpRepo.getRestaurants();
                  if (result != null) {
                    Logger.root.info('Fetched ${result.restaurants!.length} restaurants');

                    if (result.restaurants case final restaurants?) {
                      for (final restaurant in restaurants) {
                        //print(restaurant.toJson());
                      }
                    }
                  } else {
                    Logger.root.info('No restaurants fetched');
                  }
                } catch (e) {
                  Logger.root.info('Failed to fetch restaurants: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
