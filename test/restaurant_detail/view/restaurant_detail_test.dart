import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_models/restaurant_models.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:restaurant_tour/restaurant_detail/restaurant_detail.dart';

class MockRestaurantDetailBloc extends Mock implements RestaurantDetailBloc {}

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  late MockRestaurantDetailBloc mockRestaurantDetailBloc;
  late MockRestaurantRepository mockRestaurantRepository;
  late Restaurant testRestaurant;

  Widget createWidgetUnderTest() {
    return RepositoryProvider.value(
      value: mockRestaurantRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RestaurantDetailBloc>.value(
            value: mockRestaurantDetailBloc,
          ),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: RestaurantDetailView(
              restaurant: testRestaurant,
            ),
          ),
        ),
      ),
    );
  }

  setUp(() {
    mockRestaurantDetailBloc = MockRestaurantDetailBloc();
    mockRestaurantRepository = MockRestaurantRepository();

    testRestaurant = Restaurant(
      id: '1',
      name: 'Test Restaurant',
      price: '\$\$',
      rating: 4.5,
      categories: [Category(title: 'Italian', alias: 'italian')],
      photos: ['https://example.com/photo.jpg'],
      reviews: [
        const Review(
          id: 'r1',
          rating: 5,
          text: 'Excellent!',
          user: User(
            id: 'u1',
            name: 'John Doe',
            imageUrl: 'https://example.com/user.jpg',
          ),
        ),
      ],
      location: Location(formattedAddress: '123 Main St, City, Country'),
      hours: [const Hours(isOpenNow: true)],
    );

    when(() => mockRestaurantDetailBloc.state)
        .thenReturn(const RestaurantDetailLoading());

    when(() => mockRestaurantDetailBloc.stream).thenAnswer(
      (_) => Stream.fromIterable([const RestaurantDetailLoading()]),
    );
  });

  group('RestaurantDetailView', () {
    testWidgets('renders CircularProgressIndicator while loading',
        (WidgetTester tester) async {
      when(() => mockRestaurantDetailBloc.state)
          .thenReturn(const RestaurantDetailLoading());

      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders RestaurantDetailLoaded state with correct data',
        (WidgetTester tester) async {
      when(() => mockRestaurantDetailBloc.state)
          .thenReturn(const RestaurantDetailLoaded(isFavorite: false));

      when(() => mockRestaurantDetailBloc.stream).thenAnswer(
        (_) => Stream.fromIterable(
          [const RestaurantDetailLoaded(isFavorite: false)],
        ),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      await tester.pump();

      expect(find.text('Test Restaurant'), findsOneWidget);
      expect(find.text('\$\$ Italian'), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    });

    testWidgets('renders favorite icon as filled when restaurant is favorite',
        (WidgetTester tester) async {
      when(() => mockRestaurantDetailBloc.state)
          .thenReturn(const RestaurantDetailLoaded(isFavorite: true));

      when(() => mockRestaurantDetailBloc.stream).thenAnswer(
        (_) => Stream.fromIterable(
          [const RestaurantDetailLoaded(isFavorite: true)],
        ),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      await tester.pump();

      expect(find.byIcon(Icons.favorite), findsOneWidget);
    });

    testWidgets('triggers ToggleRestaurantFavorite on tap of favorite icon',
        (WidgetTester tester) async {
      when(() => mockRestaurantDetailBloc.state)
          .thenReturn(const RestaurantDetailLoaded(isFavorite: false));

      when(() => mockRestaurantDetailBloc.stream).thenAnswer(
        (_) => Stream.fromIterable(
          [const RestaurantDetailLoaded(isFavorite: false)],
        ),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      await tester.pump();

      await tester.tap(find.byIcon(Icons.favorite_border));
      verify(
        () => mockRestaurantDetailBloc
            .add(ToggleRestaurantFavorite(restaurant: testRestaurant)),
      ).called(1);
    });

    testWidgets(
        'renders all sections correctly in RestaurantDetailLoaded state',
        (WidgetTester tester) async {
      when(() => mockRestaurantDetailBloc.state)
          .thenReturn(const RestaurantDetailLoaded(isFavorite: false));

      when(() => mockRestaurantDetailBloc.stream).thenAnswer(
        (_) => Stream.fromIterable(
          [const RestaurantDetailLoaded(isFavorite: false)],
        ),
      );

      await tester.pumpWidget(
        createWidgetUnderTest(),
      );

      await tester.pump();

      expect(find.byType(Hero), findsOneWidget);
      expect(find.text('\$\$ Italian'), findsOneWidget);

      expect(find.text('123 Main St, City, Country'), findsOneWidget);

      expect(find.text('4.5'), findsOneWidget);

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Excellent!'), findsOneWidget);
    });
  });
}
