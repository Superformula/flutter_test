import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

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

  @override
  void initState() {
    super.initState();

    restaurantRepository = RestaurantRepository(
      localDataSource: InStorageRestaurantDataSource(),
      remoteDataSoruce: RemoteRestaurantDataSource(),
    );

    restaurantViewController = RestaurantViewController(
      favoritesRestaurantsUseCase: FavoritesRestaurantsUseCase(repository: restaurantRepository),
      getRestaurantReviewsUseCase: GetRestaurantReviewsUseCase(repository: restaurantRepository),
      listRestaurantsUseCase: ListRestaurantsUseCase(repository: restaurantRepository),
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
      home: HomeScreen(viewController: restaurantViewController),
    );
  }
}
