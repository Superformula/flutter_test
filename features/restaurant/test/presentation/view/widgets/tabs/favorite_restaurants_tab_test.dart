import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/presenters/favorites_restaurants_tab_presenter.dart';
import 'package:restaurant/presentation/view/widgets/loading_body.dart';
import 'package:restaurant/presentation/view/widgets/cards/restaurant_card.dart';
import 'package:restaurant/presentation/view/widgets/tabs/favorite_restaurants_tab.dart';
import 'package:state_management/presentation/sf_state.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../../mocks/server_responses.dart';

class MockFavoriteRestaurantsTabPresenter extends MockCubit<SFState>
    implements FavoriteRestaurantsTabPresenter {}

void main() {
  late MockFavoriteRestaurantsTabPresenter mockPresenter;

  setUp(() {
    mockPresenter = MockFavoriteRestaurantsTabPresenter();
    when(() => mockPresenter.loadRestaurants())
        .thenAnswer((invocation) => Future.value());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<FavoriteRestaurantsTabPresenter>(
        create: (_) => mockPresenter,
        child: const FavoriteRestaurantsTab(),
      ),
    );
  }

  group('FavoriteRestaurantsTab Widget Tests', () {
    testWidgets(
        'Given the Loading state, when the cubit emits, then it should display a LoadingBody',
        (tester) async {
      when(() => mockPresenter.state).thenReturn(SFLoadingState());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(LoadingBody), findsOneWidget);
    });

    testWidgets(
        'Given the Success state, when the cubit emits, then it should display the list of RestaurantCards',
        (tester) async {
      final restaurant =
          Restaurant.fromJson(mockedRestaurant(name: "Test Restaurant"));

      when(() => mockPresenter.state)
          .thenReturn(SFSuccessState<List<Restaurant>>(object: [restaurant]));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(RestaurantCard), findsOneWidget);
      expect(find.text('Test Restaurant'), findsOneWidget);
    });

    testWidgets(
        'Given the Error state, when the cubit emits, then it should still display a LoadingBody',
        (tester) async {
      when(() => mockPresenter.state)
          .thenReturn(SFErrorState(error: 'Error loading data'));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(LoadingBody), findsOneWidget);
    });
  });
}
