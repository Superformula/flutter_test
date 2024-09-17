import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/config/environment.dart';
import 'package:restaurant_tour/config/providers/favorites_provider.dart';
import 'package:restaurant_tour/config/providers/restaurant_providers.dart';
import 'package:restaurant_tour/config/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant_tour/infrastructure/driven_adapters/api/local_storage_api.dart';
import 'package:restaurant_tour/infrastructure/driven_adapters/api/restaurant_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: AppConstants.env);
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<Dio>(
          create: (_) => Environment.baseDioClient(),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(
            restaurantGateway: RestaurantApi(
              dio: Provider.of<Dio>(context, listen: false),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesProvider(
            localStorageGateway: LocalStorageApi(prefs: sharedPreferences),
          ),
        ),
      ],
      child: const RestaurantTour(),
    ),
  );
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppConstants.appName,
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouterManager.generateRoute,
    );
  }
}
