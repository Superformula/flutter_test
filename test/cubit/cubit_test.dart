import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/pages/pages.dart';
import 'package:restaurant_tour/repositories/repositories.dart';
import 'package:restaurant_tour/usecases/usecases.dart';
import 'package:restaurant_tour/widgets/widgets.dart';

// Mock classes
class MockRestaurantCubit extends MockCubit<RestaurantState>
    implements RestaurantCubit {}

class MockRestaurantState extends Fake implements RestaurantState {}

class MockFetchRestaurantsUseCase extends Mock implements FetchRestaurants {}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  late MockRestaurantCubit restaurantCubit;
  late MockFetchRestaurantsUseCase mockFetchRestaurantsUseCase;

  group('Load Restaurants State successfully', () {
    setUp(() {
      HttpOverrides.global = MyHttpOverrides();

      registerFallbackValue(MockRestaurantState());

      mockFetchRestaurantsUseCase = MockFetchRestaurantsUseCase();

      restaurantCubit = MockRestaurantCubit();

      // GetIt.I.registerFactory<RestaurantCubit>(
      //   () => RestaurantCubit(mockFetchRestaurantsUseCase),
      // );
    });

    tearDown(() {
      // GetIt.I.reset();
    });

    testWidgets('Display loading State', (tester) async {
      when(() => restaurantCubit.state)
          .thenReturn(const LoadingRestaurantsState(favoriteRestaurants: []));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<RestaurantCubit>.value(
            value: restaurantCubit,
            child: const HomePage(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Display List View State', (tester) async {
      var fakeData = YelpRepository().getRestaurantsFromCache();
      when(() => restaurantCubit.state).thenReturn(
        RestaurantsLoadedState(favoriteRestaurants: [], result: fakeData),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<RestaurantCubit>.value(
              value: restaurantCubit,
              child: const HomePage(),
            ),
          ),
        );
        await tester.pumpAndSettle();
      });

      expect(find.byType(HeroImageWidget), findsAny);
    });
  });
}
