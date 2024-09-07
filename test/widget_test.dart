// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/viewmodels/yelp_list_viewmodel.dart';
import 'package:restaurant_tour/viewmodels/yelp_detail_viewmodel.dart';
import 'package:restaurant_tour/views/yelp_listview.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'yelp_list_viewmodel_tests.mocks.dart';

void main() {
  setUpAll(() async {
    await dotenv.load();
  });

  group('YelpListView Tests', () {
    late MockYelpRepository mockYelpRepository;

    setUp(() {
      mockYelpRepository = MockYelpRepository();
    });

    testWidgets('Shows loading indicator when fetching data', (WidgetTester tester) async {
      when(mockYelpRepository.getRestaurants()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 500));
        return null;
      });

      final viewModel = YelpListViewModel(repository: mockYelpRepository);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => viewModel),
            ChangeNotifierProvider(create: (_) => YelpDetailViewModel()),
          ],
          child: MaterialApp(home: YelpListView()),
        ),
      );

      viewModel.fetchYelpItems();

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 500));
    });


    testWidgets('Shows list of restaurants when data is fetched', (WidgetTester tester) async {
      final mockRestaurants = RestaurantQueryResult(
        restaurants: [
          Restaurant(name: 'Test Restaurant 1', price: '\$\$', rating: 4.5, photos: ['test_photo1.jpg']),
          Restaurant(name: 'Test Restaurant 2', price: '\$\$\$', rating: 5.0, photos: ['test_photo2.jpg']),
        ],
      );
      when(mockYelpRepository.getRestaurants()).thenAnswer((_) async => mockRestaurants);

      final viewModel = YelpListViewModel(repository: mockYelpRepository);

      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => viewModel),
            ChangeNotifierProvider(create: (_) => YelpDetailViewModel()),
          ],
          child: MaterialApp(home: YelpListView()),
        ),
      );

      await tester.pump();

      expect(find.text('Test Restaurant 1'), findsOneWidget);
      expect(find.text('Test Restaurant 2'), findsOneWidget);
    });
  });
}