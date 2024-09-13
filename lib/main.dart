import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/app/app.dart';

import 'package:restaurant_tour/bootstrap.dart';

void main() async {
  bootstrap(
    builder: () async {
      final restaurantRepository =
          RestaurantRepositoryImpl(RestaurantExternalDataSource());
      return BlocProvider(
        create: (context) => FavoriteCubit(),
        child: RepositoryProvider<RestaurantRepository>(
          create: (context) => restaurantRepository,
          child: const App(),
        ),
      );
    },
  );
}
