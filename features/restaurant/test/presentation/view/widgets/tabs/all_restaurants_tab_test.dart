import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant/domain/models/restaurant.dart';
import 'package:restaurant/presentation/presenters/all_restaurants_tab_presenter.dart';
import 'package:restaurant/presentation/view/widgets/loading_body.dart';
import 'package:restaurant/presentation/view/widgets/cards/restaurant_card.dart';
import 'package:restaurant/presentation/view/widgets/tabs/all_restaurants_tab.dart';
import 'package:state_management/presentation/sf_state.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../../mocks/server_responses.dart';

class MockAllRestaurantsTabPresenter extends MockCubit<SFState>
    implements AllRestaurantsTabPresenter {}

void main() {
  late MockAllRestaurantsTabPresenter mockPresenter;

  setUp(() {
    mockPresenter = MockAllRestaurantsTabPresenter();
    when(() => mockPresenter.loadRestaurants())
        .thenAnswer((invocation) => Future.value());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<AllRestaurantsTabPresenter>(
        create: (_) => mockPresenter,
        child: const AllRestaurantsTab(),
      ),
    );
  }

  group('AllRestaurantsTab Widget Tests', () {
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
      final restaurantQueryResult = RestaurantQueryResult(
        total: 1,
        restaurants: [restaurant],
      );

      when(() => mockPresenter.state).thenReturn(
          SFSuccessState<RestaurantQueryResult>(object: restaurantQueryResult));

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
