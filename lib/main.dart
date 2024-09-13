import 'package:flutter/material.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/pages/restaurant_tour_page.dart';

void main() {
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Tour',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: RestaurantTourPage(),
      ),
    );
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text('Restaurant Tour'),
    //         ElevatedButton(
    //           child: const Text('Fetch Restaurants'),
    //           onPressed: () async {
    //             try {
    //               final result = await RestaurantsRepository.getRestaurants();
    //               if (result != null) {
    //                 print('Fetched ${result.restaurants!.length} restaurants');
    //               } else {
    //                 print('No restaurants fetched');
    //               }
    //             } catch (e) {
    //               print('Failed to fetch restaurants: $e');
    //             }
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
