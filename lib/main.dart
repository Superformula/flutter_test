import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/core/utils/router_manager.dart';
import '/repositories/yelp_repository.dart';
import 'models/restaurant.dart';

void main() {
  runApp(const ProviderScope(child: RestaurantTour()));
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Tour',
      initialRoute: Routes.main,
      onGenerateRoute: RouterManager.generateRoute,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Restaurant Tour'),
            ElevatedButton(
              child: const Text('Go To Restaurants List'),
              onPressed: () async {
                Navigator.pushNamed(
                  context,
                  Routes.restaurantList,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
