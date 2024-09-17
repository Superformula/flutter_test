import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/config/constants/constants.dart';
import 'package:restaurant_tour/config/providers/favorites_provider.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/local_storage_gateway.dart';
import 'package:restaurant_tour/domain/models/restaurant/gateway/restaurant_entity.dart';

class MockRestaurantEntity extends Mock implements RestaurantEntity {}

class MockLocalStorageGateway extends Mock implements LocalStorageGatewayInterface {}

void main() {
  late FavoritesProvider favoritesProvider;
  late RestaurantEntity mockRestaurant;
  late MockLocalStorageGateway mockLocalStorageGateway;

  Map<String, List<String>> fakePrefsData = {};

  setUpAll(() {
    registerFallbackValue(MockRestaurantEntity());
  });

  setUp(() async {
    mockLocalStorageGateway = MockLocalStorageGateway();
    mockRestaurant = MockRestaurantEntity();
    when(() => mockRestaurant.id).thenReturn('2');
    when(() => mockRestaurant.name).thenReturn('Test Restaurant 2');
    when(() => mockRestaurant.price).thenReturn('\$\$');
    when(() => mockRestaurant.rating).thenReturn(4.5);
    when(() => mockRestaurant.photos).thenReturn(['https://example.com/photo.jpg']);
    when(() => mockRestaurant.categories).thenReturn([]);
    when(() => mockRestaurant.hours).thenReturn([]);
    when(() => mockRestaurant.reviews).thenReturn([]);
    when(() => mockRestaurant.location).thenReturn(Location(formattedAddress: ''));
    fakePrefsData[AppConstants.keyFavoriteRestaurants] = [
      jsonEncode({
        'id': '1',
        'name': 'Test Restaurant',
        'price': '\$\$',
        'rating': 4.5,
        'photos': ['https://example.com/photo.jpg'],
        'categories': [],
        'hours': [],
        'location': {'formatted_address': 'Test Address'},
        'reviews': [],
      }),
    ];

    when(() => mockLocalStorageGateway.getFavoriteRestaurants()).thenAnswer(
      (_) async =>
          fakePrefsData[AppConstants.keyFavoriteRestaurants]
              ?.map(
                (json) => RestaurantEntity(
                  id: '1',
                  name: 'Test Restaurant',
                  price: '\$\$',
                  rating: 4.5,
                  categories: [],
                  photos: ['https://example.com/photo.jpg'],
                  hours: [],
                  reviews: [],
                  location: Location(formattedAddress: 'Test Address'),
                ),
              )
              .toList() ??
          [],
    );

    when(() => mockLocalStorageGateway.addFavoriteRestaurant(any())).thenAnswer((invocation) async {
      final restaurant = invocation.positionalArguments[0] as RestaurantEntity;
      final jsonData = jsonEncode({
        'id': restaurant.id,
        'name': restaurant.name,
        'price': restaurant.price,
        'rating': restaurant.rating,
        'photos': restaurant.photos,
        'categories': restaurant.categories,
        'hours': restaurant.hours,
        'location': {'formatted_address': restaurant.location.formattedAddress},
        'reviews': restaurant.reviews,
      });
      fakePrefsData[AppConstants.keyFavoriteRestaurants] ??= [];
      fakePrefsData[AppConstants.keyFavoriteRestaurants]!.add(jsonData);
    });

    when(() => mockLocalStorageGateway.deleteFavoriteRestaurant(any())).thenAnswer((invocation) async {
      final restaurantId = invocation.positionalArguments[0] as String;
      fakePrefsData[AppConstants.keyFavoriteRestaurants]!.removeWhere((json) {
        final decoded = jsonDecode(json) as Map<String, dynamic>;
        return decoded['id'] == restaurantId;
      });
    });
    when(() => mockLocalStorageGateway.addFavoriteRestaurant(any())).thenAnswer((_) async {
      final restaurant = _.positionalArguments[0] as RestaurantEntity;
      final jsonData = jsonEncode({
        'id': restaurant.id,
        'name': restaurant.name,
        'price': restaurant.price,
        'rating': restaurant.rating,
        'photos': restaurant.photos,
        'categories': restaurant.categories,
        'hours': restaurant.hours,
        'location': {'formatted_address': restaurant.location.formattedAddress},
        'reviews': restaurant.reviews,
      });
      fakePrefsData[AppConstants.keyFavoriteRestaurants] ??= [];
      fakePrefsData[AppConstants.keyFavoriteRestaurants]!.add(jsonData);
    });

    favoritesProvider = FavoritesProvider(localStorageGateway: mockLocalStorageGateway);
  });

  group('FavoritesProvider Tests', () {
    test('should load favorites from SharedPreferences', () async {
      when(() => mockRestaurant.id).thenReturn('1');
      await Future.delayed(Duration.zero);
      expect(favoritesProvider.isFavorite('1'), isTrue);
      expect(favoritesProvider.favoriteRestaurants.length, 1);
    });

    test('should toggle favorite and add restaurant', () async {
      expect(favoritesProvider.isFavorite('2'), isFalse);
      await favoritesProvider.toggleFavorite(mockRestaurant);

      expect(favoritesProvider.isFavorite('2'), isTrue);
      expect(favoritesProvider.favoriteRestaurants.length, 2);

      final savedFavorites = fakePrefsData[AppConstants.keyFavoriteRestaurants];
      expect(savedFavorites, isNotNull);
      expect(savedFavorites!.length, 2);
    });

    test('should remove restaurant from favorites', () async {
      when(() => mockRestaurant.id).thenReturn('1');
      await favoritesProvider.toggleFavorite(mockRestaurant);
      expect(favoritesProvider.isFavorite('1'), isFalse);
      expect(favoritesProvider.favoriteRestaurants.length, 0);
    });
  });
}
