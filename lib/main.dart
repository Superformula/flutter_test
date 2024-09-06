import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/di.dart';

import 'features/restaurant/presentation/manager/home_cubit.dart';
import 'features/restaurant/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const RestaurantTour());
}

class RestaurantTour extends StatelessWidget {
  const RestaurantTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Tour',
      home: BlocProvider.value(
        value: getIt.get<HomeCubit>(),
        child: const HomePage(),
      ),
    );
  }
}
