import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/features/restaurant/presentation/manager/home_cubit.dart';
import 'package:restaurant_tour/features/restaurant/presentation/pages/home_page.dart';

import 'di.dart';

class Routes {
  static const listRestaurants = "/homePage";

  static Map<String, Widget Function(BuildContext)> routes = {
    listRestaurants: (BuildContext context) => BlocProvider.value(
          value: getIt.get<HomeCubit>(),
          child: const HomePage(),
        ),
  };
}
