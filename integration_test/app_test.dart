import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/config/providers/favorites_provider.dart';
import 'package:restaurant_tour/config/providers/restaurant_providers.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_gateway.dart';
import 'package:restaurant_tour/domain/usecase/restaurant/local_storage_use_case.dart';
import 'package:restaurant_tour/infrastructure/driven_adapters/api/local_storage_api.dart';
import 'package:restaurant_tour/ui/pages/home/widgets/card_item.dart';
import 'package:restaurant_tour/ui/pages/restaurants/restaurant_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockRestaurantGateway extends Mock implements RestaurantGateway {}

class MockLocalStorageUseCase extends Mock implements LocalStorageUseCase {}

class MockRestaurantProvider extends RestaurantProvider {
  late List<RestaurantEntity> _restaurants = [];
  bool _isLoading = true;
  MockRestaurantProvider(RestaurantGateway restaurantGateway) : super(restaurantGateway: restaurantGateway);

  @override
  List<RestaurantEntity>? get restaurants => _restaurants;

  @override
  bool get isLoading => _isLoading;

  @override
  Future<void> getRestaurants({int offset = 0}) async {
    _restaurants = [
      RestaurantEntity(
        id: '1',
        name: 'Test Restaurant',
        price: '\$\$',
        rating: 4.5,
        categories: [Category(title: 'American')],
        photos: ['https://example.com/photo.jpg'],
        hours: [Hours(isOpenNow: true)],
        reviews: [],
        location: Location(formattedAddress: '123 Test St.'),
      ),
    ];
    _isLoading = false;
    notifyListeners();
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    registerFallbackValue(
      RestaurantEntity(
        id: '0',
        name: 'Test Restaurant',
        price: '',
        rating: 0.0,
        categories: [],
        photos: [],
        hours: [],
        reviews: [],
        location: Location(formattedAddress: ''),
      ),
    );
  });
  testWidgets(
      'GIVEN restaurants WHEN the app calls getRestaurants THEN the app shows the list of restaurants and user can tap to open detail restaurant',
      (WidgetTester tester) async {
    final mockRestaurantGateway = MockRestaurantGateway();
    final mockLocalStorageUseCase = MockLocalStorageUseCase();
    when(() => mockLocalStorageUseCase.getFavoriteRestaurants()).thenAnswer((_) async => []);

    when(() => mockLocalStorageUseCase.addFavoriteRestaurant(any())).thenAnswer((_) async => Future.value());

    when(() => mockLocalStorageUseCase.deleteFavoriteRestaurant(any())).thenAnswer((_) async => Future.value());
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<RestaurantProvider>(
            create: (_) => MockRestaurantProvider(mockRestaurantGateway),
          ),
          ChangeNotifierProvider(
            create: (_) => FavoritesProvider(localStorageGateway: LocalStorageApi(prefs: prefs)),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: RestaurantListPage(),
          ),
        ),
      ),
    );

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<RestaurantProvider>(
            create: (_) => MockRestaurantProvider(mockRestaurantGateway),
          ),
          ChangeNotifierProvider(
            create: (_) => FavoritesProvider(localStorageGateway: LocalStorageApi(prefs: prefs)),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: RestaurantListPage(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(CardItem), findsOneWidget);

    final firstRestaurant = find.byType(CardItem).first;
    await tester.tap(firstRestaurant);
    await tester.pumpAndSettle();

    expect(find.text('Test Restaurant'), findsOneWidget);
    await tester.pumpAndSettle();

    final backIcon = find.byIcon(Icons.arrow_back);
    await tester.tap(backIcon);
    await tester.pumpAndSettle();

    expect(find.byType(CardItem), findsOneWidget);
  });
}
