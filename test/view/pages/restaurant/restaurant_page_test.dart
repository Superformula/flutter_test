import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:restaurant_tour/data/models/restaurant.dart';
import 'package:restaurant_tour/view/cubit/favorite/favorite.dart';
import 'package:restaurant_tour/view/pages/restaurant/restaurant_page.dart';

class MockFavoriteCubit extends MockCubit<FavoriteState>
    implements FavoriteCubit {}

late FavoriteCubit favoriteCubit;
void main() {
  setUp(() => favoriteCubit = MockFavoriteCubit());

  tearDown(() => favoriteCubit.close());

  group('Snack bar tests', () {
    testWidgets('Should show favorited snack bar', (tester) async {
      await tester.runAsync(
        () async {
          final state = StreamController<FavoriteState>();

          whenListen(
            favoriteCubit,
            state.stream,
            initialState: FavoriteState(),
          );

          await mockNetworkImages(() async => _createWidget(tester));

          state.add(FavoriteState(status: FavoriteStatus.favoriteSuccess));

          await tester.pumpAndSettle();

          expect(find.text('You favorited this restaurant!'), findsOneWidget);
        },
      );
    });

    testWidgets('Should show removed snack bar', (tester) async {
      await tester.runAsync(
        () async {
          final state = StreamController<FavoriteState>();

          whenListen(
            favoriteCubit,
            state.stream,
            initialState: FavoriteState(),
          );

          await mockNetworkImages(() async => _createWidget(tester));

          state.add(FavoriteState(status: FavoriteStatus.removed));

          await tester.pumpAndSettle();

          expect(find.text('You unfavorited this restaurant!'), findsOneWidget);
        },
      );
    });
  });

  testWidgets('Find page appbar and  body', (tester) async {
    when(() => favoriteCubit.state).thenReturn(FavoriteState());

    await mockNetworkImages(() async => _createWidget(tester));

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: BlocProvider.value(
        value: favoriteCubit,
        child: RestaurantPage(
          restaurant: _restaurant,
        ),
      ),
    ),
  );
}

Restaurant _restaurant = const Restaurant(name: 'Pollos hermanos', id: '1');
