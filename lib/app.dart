import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_tour/home/domain/usecases/get_all_restaurants.dart';
import 'package:restaurant_tour/routes.dart';

import 'home/data/datasources/home_data_source.dart';
import 'home/data/repositories/home_repository.dart';
import 'home/domain/repositories/home_repository_interface.dart';
import 'home/presentation/bloc/home_bloc.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  List<RepositoryProvider> get listRepositoryProvider => [
        RepositoryProvider<HomeRepositoryInterface>(
          create: (context) => HomeRepository(
            HomeDataSource(),
          ),
        ),
      ];

  List<BlocProvider> get listBlocProvider => [
        BlocProvider<RestaurantsBloc>(
          create: (context) {
            final repository = context.read<HomeRepositoryInterface>();

            return RestaurantsBloc(
              GetAllRestaurants(repository),
            )..add(GetAllRestaurantsEvent());
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: listRepositoryProvider,
      child: MultiBlocProvider(
        providers: listBlocProvider,
        child: MaterialApp.router(
          scaffoldMessengerKey: _scaffoldMessengerKey,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routerConfig: Routes.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
