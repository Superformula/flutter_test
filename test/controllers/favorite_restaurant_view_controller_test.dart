import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/controllers/favorite_restaurant_view_controller.dart';
import 'package:restaurant_tour/data/restaurant_data_source.dart';
import 'package:restaurant_tour/data/restaurant_repository.dart';
import 'package:restaurant_tour/domain/favorite_restaurant_use_case.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';
import 'package:uuid/v4.dart';

@GenerateNiceMocks([
  MockSpec<RemoteRestaurantDataSource>(),
  MockSpec<InStorageRestaurantDataSource>(),
])
import 'favorite_restaurant_view_controller_test.mocks.dart';

void main() {
  group(
    'FavoriteRestaurantViewController',
    () {
      const uuidv4 = UuidV4();

      final greatestRestaurants = [
        for (int index = 0; index < 20; index = index + 1)
          RestaurantData(
            id: index.toString(),
            name: 'restaurant',
            price: r'$$$',
            rating: 5,
            photos: [],
            reviews: [
              RestaurantReviewData(
                id: uuidv4.generate(),
                rating: 5,
                text: 'Best restaurant ever!',
                user: UserData(id: uuidv4.generate(), name: 'Jhon doe'),
              ),
            ],
            categories: [],
            location: const RestaurantLocationData(address: 'address'),
            hours: [],
          ),
      ];

      late MockRemoteRestaurantDataSource remoteDataSoruce;
      late MockInStorageRestaurantDataSource localDataSource;
      late RestaurantRepository restaurantRepository;
      late FavoriteRestaurantViewController subject;

      setUp(() {
        remoteDataSoruce = MockRemoteRestaurantDataSource();
        localDataSource = MockInStorageRestaurantDataSource();
        restaurantRepository = RestaurantRepository(
          remoteDataSoruce: remoteDataSoruce,
          localDataSource: localDataSource,
        );

        subject = FavoriteRestaurantViewController(
          favoritesRestaurantsUseCase: FavoritesRestaurantsUseCase(repository: restaurantRepository),
        );
      });

      test('should select an specific restaurant as favorite', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        await restaurantRepository.getRestaurants(offset: 0);

        subject.favoritateRestaurant(restaurantId: '0', offset: 0, isFavorite: true);

        if (subject.state case FavoriteRestaurantViewModelData(favorites: final favorites)) {
          expect(favorites[0].isFavorite, isTrue);
          expect(favorites.length, equals(1));
        }
      });

      test('should list all favorite restaurants', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return [
            const RestaurantData(
              id: '0',
              name: 'name',
              price: r'$$$',
              rating: 5.0,
              photos: [],
              reviews: [],
              categories: [],
              location: RestaurantLocationData(address: 'address'),
              hours: [],
              isFavorite: true,
            ),
            ...greatestRestaurants.sublist(1),
          ];
        });

        await restaurantRepository.getRestaurants(offset: 0);

        subject.getFavoriteRestaurants();

        if (subject.state case FavoriteRestaurantViewModelData(favorites: final favorites)) {
          expect(favorites[0].isFavorite, isTrue);
          expect(favorites.length, equals(1));
        }
      });
    },
  );
}
