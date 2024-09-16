import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';
import 'package:restaurant_tour/view/cubit/restaurants/restaurants.dart';
import 'package:restaurant_tour/view/pages/home/home_page.dart';
import 'package:restaurant_tour/view/pages/home/widgets/restaurants_tab_widget.dart';

class MockRestaurantsCubit extends MockCubit<RestaurantsState>
    implements RestaurantsCubit {}

class MockFavoriteCubit extends MockCubit<FavoriteState>
    implements FavoriteCubit {}

late RestaurantsCubit restaurantsCubit;
late FavoriteCubit favoriteCubit;

void main() {
  setUp(
    () {
      restaurantsCubit = MockRestaurantsCubit();
      favoriteCubit = MockFavoriteCubit();
    },
  );

  tearDown(
    () {
      restaurantsCubit.close();
      favoriteCubit.close();
    },
  );

  testWidgets('Find restaurants tab after RestaurantsStatus.success',
      (tester) async {
    when(() => restaurantsCubit.fetchRestaurants())
        .thenAnswer((_) => Future.value());

    when(() => restaurantsCubit.state).thenReturn(
      RestaurantsState(
        status: RestaurantsStatus.success,
        restaurants: [const Restaurant(id: '1', name: 'Pollos hermanos')],
      ),
    );

    await mockNetworkImages(() async => _createWidget(tester));

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.byType(RestaurantsTabWidget), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: restaurantsCubit,
          ),
          BlocProvider.value(
            value: favoriteCubit,
          ),
        ],
        child: const HomePage(),
      ),
    ),
  );
}
