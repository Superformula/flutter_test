import 'package:go_router/go_router.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/home/screen/screen.dart';
import 'package:restaurant_tour/features/restaurants/restaurant_detail/screen/restaurant_detail_screen.dart';

GoRouter getGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        name: HomeScreen.routePath,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: RestaurantDetailScreen.routeName,
        path: '/${RestaurantDetailScreen.routeName}',
        builder: (context, state) {
          final restaurant = state.extra! as Restaurant;
          return RestaurantDetailScreen(restaurant: restaurant);
        },
      ),
    ],
  );
}
