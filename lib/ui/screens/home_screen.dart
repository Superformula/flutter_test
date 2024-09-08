import 'package:flutter/material.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'package:restaurant_tour/typography.dart';

import 'restaurants_list_screen.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<RestaurantQueryResult?> initializationFuture;
  late final YelpRepository repository;

  @override
  void initState() {
    super.initState();

    repository = YelpRepository();
    // Just for testing purpose
    initializationFuture = repository.getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 4,
          shadowColor: const Color(0xff000033),
          title: const Text(
            'RestauranTour',
            style: AppTextStyles.loraRegularHeadline,
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: DefaultTextStyle(
              style: AppTextStyles.openRegularTitleSemiBold,
              child: TabBar(
                labelPadding: EdgeInsets.all(8),
                tabAlignment: TabAlignment.center,
                dividerColor: Colors.transparent,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Text('All Restaurants'),
                  Text('My Favorites'),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              FutureBuilder(
                future: initializationFuture,
                builder: (context, snapshot) {
                  final Widget content;

                  if (snapshot.data case RestaurantQueryResult(restaurants: final restaurants?) when snapshot.hasData) {
                    content = RestaurantsList(restaurants: restaurants);
                  } else {
                    content = const Center(
                      // TODO: fix color
                      child: CircularProgressIndicator(),
                    );
                  }

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: content,
                  );
                },
              ),
              const ColoredBox(color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
