import 'package:flutter/material.dart';
import 'package:restaurant_tour/injection.dart';
import 'package:restaurant_tour/domain/repositories/yelp_repository.dart';
import 'package:restaurant_tour/presentation/routes/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final appRouter = AppRouter();
  configureDependencies();
  runApp(RestaurantTour(appRouter: appRouter));
}

class RestaurantTour extends StatelessWidget {
  final AppRouter appRouter;

  const RestaurantTour({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
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
              child: const Text('Fetch Restaurants'),
              onPressed: () async {
                final yelpRepo = YelpRepository();

                try {
                  final result = await yelpRepo.getRestaurants();
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
