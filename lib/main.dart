import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';

import 'cubit.dart';
import 'ui/colors.dart';
import 'ui/screens/restaurants_list_screen/cubit.dart';
import 'ui/screens/restaurants_list_screen/restaurants_list_screen.dart';
import 'ui/typography.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb //
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(const RestaurantTourApp());
}

final class RestaurantTourApp extends StatelessWidget {
  const RestaurantTourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RestaurantsRepository>(
          create: (context) {
            if (const bool.hasEnvironment('YELP_API_KEY')) {
              return HttpRestaurantsRepository();
            } else {
              return MockedRestaurantsRepository(
                minimumThrottle: 500,
                maximumThrottle: 2000,
              );
            }
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            dynamicSchemeVariant: DynamicSchemeVariant.monochrome,
            seedColor: Colors.black,
          ),
        ).copyWith(
          appBarTheme: const AppBarTheme(
            titleTextStyle: AppTextStyles.loraHeading6,
          ),
          dividerTheme: const DividerThemeData(
            color: Colors.dividerColor,
          ),
          tabBarTheme: TabBarTheme(
            labelStyle: AppTextStyles.openSemiBold,
            unselectedLabelStyle: AppTextStyles.openSemiBold.copyWith(
              color: Colors.textSecondary,
            ),
          ),
        ),
        title: 'Restaurant Tour',
        home: BlocProvider<RestaurantsListScreenCubit>(
          create: (context) => RestaurantsListScreenCubit(
            repository: context.read(),
          ),
          child: const RestaurantsListScreen(),
        ),
        builder: (context, child) {
          return BlocProvider(
            create: (context) => RestaurantTourCubit(),
            child: child,
          );
        },
      ),
    );
  }
}
