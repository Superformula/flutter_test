import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'package:restaurant_tour/ui/screens/list_restaurants_screen/bloc.dart';

import 'ui/colors.dart';
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
        Provider<YelpRepository>(
          create: (context) {
            return MockedYelpRepository(
              minimumThreshold: 500,
              maximumThreshold: 2000,
            );
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
        home: const ListRestaurantsScreenCubitWrapper(),
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

class RestaurantTourCubit extends HydratedCubit<List<String>> {
  RestaurantTourCubit() : super([]);

  bool favorited(String id) => state.contains(id);

  void favorite(String id) {
    assert(!state.contains(id));
    emit([...state, id]);
  }

  void unfavorite(String id) {
    assert(state.contains(id));
    emit([...state..remove(id)]);
  }

  void toggleFavorite(String id) {
    if (favorited(id)) {
      unfavorite(id);
    } else {
      favorite(id);
    }
  }

  @override
  List<String> fromJson(Map<String, Object?> json) => json['favorited'] as List<String>;

  @override
  Map<String, Object?> toJson(List<String> state) {
    return {
      'favorited': state,
    };
  }
}
