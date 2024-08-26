import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/cubit/cubit.dart';
import 'package:restaurant_tour/datasources/yielp_datasource.dart';
import 'package:restaurant_tour/network/dio_http_client.dart';
import 'package:restaurant_tour/pages/pages.dart';
import 'package:restaurant_tour/repositories/repositories.dart';
import 'package:restaurant_tour/usecases/usecases.dart';
import 'package:restaurant_tour/widgets/widgets.dart';

// Mock classes
class MockRestaurantCubit extends MockCubit<RestaurantState>
    implements RestaurantCubit {}

class MockRestaurantState extends Fake implements RestaurantState {}

class MockFetchRestaurantsUseCase extends Mock implements FetchRestaurants {}

class MockDio extends Mock implements Dio {}

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

  group('Home Page Widget Testing', () {
    setUp(() {
      HttpOverrides.global = MyHttpOverrides();

      registerFallbackValue(MockRestaurantState());

      restaurantCubit = MockRestaurantCubit();
      GetIt.I.registerSingleton<RestaurantCubit>(restaurantCubit);
    });

    tearDown(() {
      GetIt.I.reset();
    });

    testWidgets(
        'Expects to display a loading State with CircularProgressIndicator',
        (tester) async {
      when(() => restaurantCubit.state)
          .thenReturn(const LoadingRestaurantsState(favoriteRestaurants: []));

      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: GetIt.I<RestaurantCubit>(),
              child: const HomePage(),
            ),
          ),
        );

        await tester.pump(Duration(seconds: 1));
      });

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'When restaurants are loaded, display a listview with a HeroImageWidget',
        (tester) async {
      var fakeData = YelpRepository(
        datasource: YielpDatasource(
          baseUrl: 'http://example.com/get',
          networkClient: DioHttpClient(dio: MockDio()),
        ),
      ).getRestaurantsFromCache();
      when(() => restaurantCubit.state).thenReturn(
        RestaurantsLoadedState(favoriteRestaurants: [], result: fakeData),
      );
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: GetIt.I<RestaurantCubit>(),
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
