import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:restaurant_tour/presentation/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType {
    if (Platform.isIOS) {
      return const RouteType.cupertino();
    } else {
      return const RouteType.material();
    }
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(page: RestaurantDetailsRoute.page),
      ];
}
