import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_tour/di/di.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/query.dart';
import 'package:restaurant_tour/view/pages/main_page.dart';
import './view/theme/app_theme.dart';

const _apiKey = '<PUT YOUR API KEY HERE>';
const _baseUrl = 'https://api.yelp.com/v3/graphql';

void main() {
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatefulWidget {
  const RestaurantTour({super.key});

  @override
  State<RestaurantTour> createState() => _RestaurantTourState();
}

class _RestaurantTourState extends State<RestaurantTour> {
  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      theme: AppTheme.lightTheme,
      home: const MainPage(),
    );
  }
}

// TODO: Architect code
// This is just a POC of the API integration
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/graphql',
    };

    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: query(offset),
      );

      if (response.statusCode == 200) {
        return RestaurantQueryResult.fromJson(
          jsonDecode(response.body)['data']['search'],
        );
      } else {
        print('Failed to load restaurants: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching restaurants: $e');
      return null;
    }
  }

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
                try {
                  final result = await getRestaurants();
                  if (result != null) {
                    print('Fetched ${result.restaurants!.length} restaurants');
                  } else {
                    print('No restaurants fetched');
                  }
                } catch (e) {
                  print('Failed to fetch restaurants: $e');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
