import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/cubit.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/ui/screens/restaurants_list_screen/cubit.dart';
import 'package:restaurant_tour/ui/screens/restaurants_list_screen/restaurants_list_screen.dart';

import '../../../empty_data_restaurants_repository.dart';
import '../../../mock_image_http.dart';

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();

    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((invocation) async {});

    HydratedBloc.storage = storage;
  });

  group(RestaurantsListScreen, () {
    testWidgets('should start in the loading state', (tester) async {
      await testWithMockedImageHttpClient(() async {
        await tester.pumpWidget(
          _RestaurantsListScreenTest(),
        );

        expect(
          find.byType(CircularProgressIndicator),
          findsOneWidget,
        );

        await tester.pumpAndSettle();
      });
    });

    testWidgets('should show a list of restaurants after loading', (tester) async {
      await testWithMockedImageHttpClient(() async {
        await tester.pumpWidget(
          _RestaurantsListScreenTest(),
        );

        await tester.pumpAndSettle();

        expect(
          find.byType(CircularProgressIndicator),
          findsNothing,
        );

        expect(
          find.byType(RestaurantCard, skipOffstage: false),
          findsAny,
        );
      });
    });

    testWidgets("should show the empty state screen when there's no data", (tester) async {
      await testWithMockedImageHttpClient(() async {
        await tester.pumpWidget(
          _RestaurantsListScreenTest(
            repository: const EmptyDataRestaurantsRepository(),
          ),
        );

        await tester.pumpAndSettle();

        expect(
          find.byType(CircularProgressIndicator),
          findsNothing,
        );

        expect(
          find.byType(RestaurantCard),
          findsNothing,
        );

        expect(
          find.text('No restaurants were found.'),
          findsOne,
        );
      });
    });

    testWidgets("should start without any favorited restaurant", (tester) async {
      await testWithMockedImageHttpClient(() async {
        await tester.pumpWidget(
          _RestaurantsListScreenTest(),
        );

        await tester.pumpAndSettle();

        expect(
          find.byType(CircularProgressIndicator),
          findsNothing,
        );

        expect(
          find.byType(RestaurantCard),
          findsAny,
        );

        final textFinder = find.textRange.ofSubstring('My Favorites');
        expect(
          textFinder,
          findsOne,
        );

        await tester.tap(
          find.text('My Favorites'),
        );

        await tester.pumpAndSettle();

        expect(
          find.byType(RestaurantCard),
          findsNothing,
        );

        expect(
          find.text('You have no favorite restaurants.'),
          findsOne,
        );
      });
    });

    testWidgets("should show the favorite restaurants after one has been added", (tester) async {
      await testWithMockedImageHttpClient(() async {
        await tester.pumpWidget(
          _RestaurantsListScreenTest(),
        );

        await tester.pumpAndSettle();

        expect(
          find.byType(CircularProgressIndicator),
          findsNothing,
        );

        final findCard = find.byType(RestaurantCard);

        expect(
          findCard,
          findsAny,
        );

        await tester.tap(findCard.first);

        await tester.pumpAndSettle();

        final findFavoriteButton = find.widgetWithIcon(
          IconButton,
          Icons.favorite_outline,
        );

        expect(
          findFavoriteButton,
          findsOne,
        );

        await tester.tap(findFavoriteButton.first);
        await tester.pumpAndSettle();
        await tester.pageBack();
        await tester.pumpAndSettle();

        await tester.tap(
          find.text('My Favorites'),
        );

        await tester.pumpAndSettle();

        expect(
          find.byType(RestaurantCard),
          findsOne,
        );
      });
    });
  });
}

final class _RestaurantsListScreenTest extends StatelessWidget {
  _RestaurantsListScreenTest({
    RestaurantsRepository? repository,
  }) : _repository = repository ??
            MockedRestaurantsRepository(
              minimumThrottle: 500,
              maximumThrottle: 500,
            );

  final RestaurantsRepository _repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => RestaurantsListScreenCubit(repository: _repository),
        child: const RestaurantsListScreen(),
      ),
      builder: (context, child) {
        return BlocProvider(
          create: (context) => RestaurantTourCubit(),
          child: child,
        );
      },
    );
  }
}

class MockStorage extends Mock implements Storage {}
