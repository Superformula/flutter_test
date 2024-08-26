import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/repositories/repositories.dart';
import 'package:restaurant_tour/theme/text.dart';
import 'pages/home_page.dart';
import 'usecases/fetch_restaurants.dart';

Future<void> main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const RestaurantTour());
}

void setup() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<YelpRepository>(YelpRepository());

  getIt.registerSingleton<FetchRestaurants>(
    FetchRestaurants(repository: getIt<YelpRepository>()),
  );
  getIt.registerSingleton<RestaurantCubit>(
    RestaurantCubit(getIt<FetchRestaurants>()),
  );
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.instance<RestaurantCubit>()..fetchRestaurants(),
      child: MaterialApp(
        title: 'Restaurant Tour',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          fontFamily: 'Lora',
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
          textTheme: ThemeText.textTheming,
        ),
      ),
    );
  }
}
