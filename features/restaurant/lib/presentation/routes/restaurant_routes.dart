import 'package:restaurant/presentation/view/pages/restaurant_details_page.dart';

abstract class RestaurantRoutes {
  static var routes = {
    "/restaurant/details": (context) => const RestaurantDetailsPage(),
  };
}
