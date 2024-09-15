import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/models/restaurant.dart';
import 'package:restaurant_tour/presentation/controllers/restaurants/restaurants_cubit.dart';
import 'package:restaurant_tour/presentation/pages/restaurants_page.dart';
import 'package:restaurant_tour/presentation/widgets/restaurants_list.dart';

import '../../utils/mocks.dart';

void main() {
  late MockRestaurantsCubit mockRestaurantsCubit;

  setUp(() {
    mockRestaurantsCubit = MockRestaurantsCubit();
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('should render RestaurantPage', (WidgetTester tester) async {
    when(() => mockRestaurantsCubit.state)
        .thenReturn(RestaurantsCubitLoading());
    when(() => mockRestaurantsCubit.getRestaurants()).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RestaurantsCubit>(
          create: (_) => mockRestaurantsCubit,
          child: const RestaurantsPage(),
        ),
      ),
    );

    final resturantPage = find.byType(RestaurantsPage);

    // Expect CircularProgressIndicator while loading
    expect(resturantPage, findsOneWidget);
  });
  testWidgets('RestaurantsPage shows loading indicator while loading',
      (WidgetTester tester) async {
    when(() => mockRestaurantsCubit.state)
        .thenReturn(RestaurantsCubitLoading());
    when(() => mockRestaurantsCubit.getRestaurants()).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RestaurantsCubit>(
          create: (_) => mockRestaurantsCubit,
          child: const RestaurantsPage(),
        ),
      ),
    );

    final progressIndicator = find.byType(CircularProgressIndicator);

    expect(progressIndicator, findsOneWidget);
  });

  testWidgets('RestaurantsPage shows list when restaurants are loaded',
      (WidgetTester tester) async {
    when(() => mockRestaurantsCubit.state).thenReturn(
      RestaurantsCubitLoaded(
        [
          Restaurant(
            name: 'Test Restaurant 1',
            id: 'id1',
            categories: [
              Category(title: 'Test Category 1'),
            ],
            photos: const [
              'https://i.natgeofe.com/n/04cf2a79-4a49-45eb-90f8-38356167690d/image00037.jpeg'
            ],
            hours: const [
              Hours(isOpenNow: true),
            ],
            location: Location(
              formattedAddress: 'Test Address 1',
            ),
            price: 'PRice',
            rating: 4.5,
            reviews: const [
              Review(
                id: 'id1',
                rating: 4,
                text: 'Test Review 1',
                user: User(
                  id: 'id1',
                  name: 'Test User 1',
                  imageUrl:
                      'https://i.natgeofe.com/n/04cf2a79-4a49-45eb-90f8-38356167690d/image00037.jpeg',
                ),
              ),
            ],
          ),
          Restaurant(
            name: 'Test Restaurant 2',
            id: 'id1',
            categories: [
              Category(title: 'Test Category 2'),
            ],
            photos: const ['test.jpg'],
            hours: const [
              Hours(isOpenNow: true),
            ],
            location: Location(
              formattedAddress: 'Test Address 2',
            ),
            price: 'PRice',
            rating: 4.5,
            reviews: const [
              Review(
                id: 'id1',
                rating: 4,
                text: 'Test Review 2',
                user: User(
                  id: 'id1',
                  name: 'Test User 2',
                  imageUrl: 'test.jpg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
    when(() => mockRestaurantsCubit.getRestaurants()).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<RestaurantsCubit>(
            create: (_) => mockRestaurantsCubit,
            child: const RestaurantsPage(),
          ),
        ),
      ),
    );

    expect(find.byType(RestaurantsList), findsOneWidget);
  });

  testWidgets('RestaurantsPage shows error message on failure',
      (WidgetTester tester) async {
    // Mock the failure state
    when(() => mockRestaurantsCubit.state)
        .thenReturn(RestaurantsCubitError(''));
    when(() => mockRestaurantsCubit.getRestaurants()).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<RestaurantsCubit>(
          create: (_) => mockRestaurantsCubit,
          child: const RestaurantsPage(),
        ),
      ),
    );

    expect(find.text('Failed to fetch restaurants'), findsOneWidget);
  });
}
