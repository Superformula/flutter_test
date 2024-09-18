import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/presentation/presentation.dart';
import 'package:restaurant_tour/ui/pages/pages.dart';
import 'package:restaurant_tour/ui/widgets/widgets.dart';

import '../../../core/factories.dart';

class SpyCubitRestaurantTourPresenter extends MockCubit<RestaurantState> implements CubitRestaurantTourPresenter {}

class SpyNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRestaurantEntity extends Fake implements RestaurantEntity {}

class FakeFavoriteRestaurantEntity extends Fake implements FavoriteRestaurantEntity {}

class FakeRoute extends Fake implements Route {}

void main() {
  late CubitRestaurantTourPresenter presenter;
  late NavigatorObserver navigatorObserver;
  late RestaurantEntity restaurantEntity;
  late FavoriteRestaurantEntity favoriteRestaurantEntity;

  void mockErrorState() {
    whenListen(
      presenter,
      Stream.fromIterable([RestaurantErrorState('any_message')]),
      initialState: RestaurantInitialState(),
    );
  }

  void mockLoadingState() {
    whenListen(
      presenter,
      Stream.fromIterable([RestaurantLoadingState()]),
      initialState: RestaurantInitialState(),
    );
  }

  void mockSuccessState() {
    whenListen(
      presenter,
      Stream.fromIterable([RestaurantSuccessState()]),
      initialState: RestaurantInitialState(),
    );
  }

  void mockGetAllRestaurants() {
    when(() => presenter.getAllRestaurants()).thenAnswer((_) => Future.value());
  }

  void mockGetFavoriteRestaurants() {
    when(() => presenter.getFavoriteRestaurants()).thenAnswer((_) => Future.value());
  }

  void mockRestaurantList({restaurantList = const <RestaurantEntity>[]}) {
    when(() => presenter.restaurantList).thenReturn(restaurantList);
  }

  void mockFavoriteRestaurantList({favoriteRestaurantList = const <FavoriteRestaurantEntity>[]}) {
    when(() => presenter.favoriteRestaurantList).thenReturn(favoriteRestaurantList);
  }

  setUp(() {
    presenter = SpyCubitRestaurantTourPresenter();
    navigatorObserver = SpyNavigatorObserver();
    restaurantEntity = makeRestaurantEntity();
    favoriteRestaurantEntity = makeFavoriteRestaurantEntity();
    mockSuccessState();
    mockGetAllRestaurants();
    mockGetFavoriteRestaurants();
    mockRestaurantList();
    mockFavoriteRestaurantList();
  });

  setUpAll(() {
    registerFallbackValue(FakeRestaurantEntity());
    registerFallbackValue(FakeFavoriteRestaurantEntity());
    registerFallbackValue(FakeRoute());
  });

  Future<void> loadPage(WidgetTester tester) async {
    final page = BlocProvider<CubitRestaurantTourPresenter>.value(
      value: presenter,
      child: MaterialApp(
        home: RestaurantTourPage(presenter: presenter),
        navigatorObservers: [navigatorObserver],
      ),
    );
    await tester.pumpWidget(page);
  }

  testWidgets('Should load the page with correct widgets', (tester) async {
    await loadPage(tester);
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(TabBarView), findsOneWidget);
    expect(find.text('No restaurants.'), findsOneWidget);
    expect(find.byKey(restaurantListKey), findsNothing);
  });

  testWidgets('Should show a list of restaurants when there is a restaurant', (tester) async {
    mockRestaurantList(restaurantList: [restaurantEntity]);
    await loadPage(tester);
    expect(find.byKey(restaurantListKey), findsOneWidget);
  });

  testWidgets('Should favorites content when favorite tab was tapped', (tester) async {
    await loadPage(tester);
    final favoriteTab = find.widgetWithText(Tab, 'My Favorites');
    await tester.tap(favoriteTab);
    await tester.pumpAndSettle();
    expect(find.text('No favorites.'), findsOneWidget);
  });

  testWidgets('Should show a list of favorite restaurants when there is a favorite restaurant', (tester) async {
    mockFavoriteRestaurantList(favoriteRestaurantList: [favoriteRestaurantEntity]);
    await loadPage(tester);
    final favoriteTab = find.widgetWithText(Tab, 'My Favorites');
    await tester.tap(favoriteTab);
    await tester.pumpAndSettle();
    expect(find.text('No favorites.'), findsNothing);
    expect(find.byKey(favoriteRestaurantListKey), findsOneWidget);
  });

  testWidgets('Should show a SnackBar when [RestaurantErrorState] was emitted', (tester) async {
    mockErrorState();
    await loadPage(tester);
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('any_message'), findsOneWidget);
  });

  testWidgets('Should show a CircularLoading when [RestaurantLoadingState] was emitted', (tester) async {
    mockLoadingState();
    await loadPage(tester);
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.byType(CircularLoading), findsOneWidget);
  });

  testWidgets('Should navigate when RestaurantItem was tapped', (tester) async {
    mockRestaurantList(restaurantList: [restaurantEntity]);
    await loadPage(tester);
    final restaurantItem = find.byKey(restaurantItemKey(restaurantEntity.id));
    await tester.tap(restaurantItem);
    await tester.pumpAndSettle();
    verify(() => navigatorObserver.didPush(any(), any()));
  });
}
