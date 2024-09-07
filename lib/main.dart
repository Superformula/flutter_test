import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'package:restaurant_tour/ui/screens/restaurants_list_screen.dart';

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

final class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          title: const Text('RestauranTour'),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            // add bottom shadow
            child: TabBar(
              labelPadding: EdgeInsets.all(8),
              tabAlignment: TabAlignment.center,
              tabs: [
                Text('All Restaurants'),
                Text('My Favorites'),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: initializationFuture,
            builder: (context, snapshot) {
              final Widget content;

              if (snapshot.data case RestaurantQueryResult(restaurants: final restaurants?) when snapshot.hasData) {
                content = RestaurantsList(restaurants: restaurants);
              } else {
                content = const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                child: content,
              );
            },
          ),
        ),
      ),
    );
  }
}
