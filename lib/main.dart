import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:restaurant_tour/controllers/favorite_restaurant_view_controller.dart';

import 'controllers/restaurant_view_controller.dart';
import 'data/restaurant_data_source.dart';
import 'data/restaurant_repository.dart';
import 'domain/favorite_restaurant_use_case.dart';
import 'domain/get_restaurant_reviews.dart';
import 'domain/list_restaurants_use_case.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Logger.root.onRecord.listen((record) {
        debugPrint('${record.level.name}: ${record.time}: ${record.message}');
      });

      FlutterError.onError = (errorDetails) {
        Logger.root.severe(errorDetails.summary, errorDetails.exception, errorDetails.stack);
      };

      await Hive.initFlutter();

      runApp(const RestaurantTourApp());
    },
    (error, stackTrace) {
      Logger.root.severe('The app has experienced a crash.', error, stackTrace);
    },
    zoneValues: {#flutter.io.allow_http: false},
  );
}

final class RestaurantTourApp extends StatefulWidget {
  const RestaurantTourApp({super.key});

  @override
  State<RestaurantTourApp> createState() => _RestaurantTourAppState();
}

class _RestaurantTourAppState extends State<RestaurantTourApp> {
  late final RestaurantRepository restaurantRepository;
  late final RestaurantViewController restaurantViewController;
  late final FavoriteRestaurantViewController favoriteRestaurantViewController;

  @override
  void initState() {
    super.initState();

    restaurantRepository = RestaurantRepository(
      localDataSource: InStorageRestaurantDataSource(),
      remoteDataSoruce: RemoteRestaurantDataSource(),
    );

    restaurantViewController = RestaurantViewController(
      getRestaurantReviewsUseCase: GetRestaurantReviewsUseCase(repository: restaurantRepository),
      listRestaurantsUseCase: ListRestaurantsUseCase(repository: restaurantRepository),
    );

    favoriteRestaurantViewController = FavoriteRestaurantViewController(
      favoritesRestaurantsUseCase: FavoritesRestaurantsUseCase(repository: restaurantRepository),
    );
  }

  @override
  void dispose() {
    restaurantRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      title: 'Restaurant Tour',
      home: HomeScreen(
        restaurantViewController: restaurantViewController,
        favoriteRestaurantViewController: favoriteRestaurantViewController,
      ),
    );
  }
}
