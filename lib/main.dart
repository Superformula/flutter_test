import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_tour/core/models/restaurant.dart';
import 'package:restaurant_tour/features/home_page/presenter/screen/home_screen.dart';
import 'package:restaurant_tour/query.dart';

const _apiKey = '<PUT YOUR API KEY HERE>';
const _baseUrl = 'https://api.yelp.com/v3/graphql';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const RestaurantTour(),
  );
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Restaurant Tour',
      home: HomeScreen(),
    );
  }
}

// TODO: Architect code
// This is just a POC of the API integration
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
//     final headers = {
//       'Authorization': 'Bearer ${dotenv.env['YEP_API_KEY']}',
//       'Content-Type': 'application/graphql',
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(_baseUrl),
//         headers: headers,
//         body: query(offset),
//       );

//       if (response.statusCode == 200) {
//         return RestaurantQueryResult.fromJson(
//           jsonDecode(response.body)['data']['search'],
//         );
//       } else {
//         print('Failed to load restaurants: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching restaurants: $e');
//       return null;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Restaurant Tour'),
//             ElevatedButton(
//               child: const Text('Fetch Restaurants'),
//               onPressed: () async {
//                 try {
//                   final result = await getRestaurants();
//                   if (result != null) {
//                     print('Fetched ${result.restaurants!.length} restaurants');
//                   } else {
//                     print('No restaurants fetched');
//                   }
//                 } catch (e) {
//                   print('Failed to fetch restaurants: $e');
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
