import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/view/widgets/restaurant_tile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RestauranTour'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Restaurants',
            ),
            Tab(text: 'Favorites'),
          ]),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: _buildRestaurantList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 8.0, left: 8.0),
            child: _buildRestaurantList(),
          ),
        ]),
      ),
    );
  }
}

Widget _buildRestaurantList() {
  final _random = new Random();
  final min = 1;
  final max = 5;
  final restaurants = [1, 2, 3, 4, 5]
      .map(
        (e) => Restaurant(
          id: "restaurant_$e",
          name: "Amazing Pizza",
          price: "\$\$\$",
          rating: 4.8,
          photos: ["https://picsum.photos/361/360"],
          categories: [Category(alias: 'demo', title: 'Italian')],
          hours: [const Hours(isOpenNow: true)],
          location: Location(formattedAddress: "123 Main St, Anytown, CA"),
          reviews: [1, 2, 3, 4, 5, 6]
              .map((e) => Review(
                    id: 'review_id',
                    text:
                        'Review text goes here. Review text goes here. This is a review. This is a review that is 3 lines long.',
                    rating: min + _random.nextInt(max - min),
                    user: const User(
                      id: 'user_id',
                      imageUrl: 'https://picsum.photos/200/300',
                      name: 'Test User',
                    ),
                  ))
              .toList(),
        ),
      )
      .toList();

  return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
            height: 2,
          ),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return RestaurantTile(restaurant: restaurants[index]);
      });
  // return const Center(
  //   child: CircularProgressIndicator(),
  // );
}
