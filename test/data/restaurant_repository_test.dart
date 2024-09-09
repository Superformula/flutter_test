import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:restaurant_tour/data/restaurant_data_source.dart';
import 'package:restaurant_tour/data/restaurant_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';
import 'package:uuid/v4.dart';

@GenerateNiceMocks([
  MockSpec<RemoteRestaurantDataSource>(),
  MockSpec<InStorageRestaurantDataSource>(),
])
import 'restaurant_repository_test.mocks.dart';

void main() {
  group(
    'RestaurantRepository',
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
      late RestaurantRepository subject;

      setUp(() {
        remoteDataSoruce = MockRemoteRestaurantDataSource();
        localDataSource = MockInStorageRestaurantDataSource();
        subject = RestaurantRepository(
          remoteDataSoruce: remoteDataSoruce,
          localDataSource: localDataSource,
        );
      });

      test('should load data from remote when there is none already loaded in disk', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        final restaurants = await subject.getRestaurants(offset: 0);

        expect(restaurants, equals(greatestRestaurants));

        verify(localDataSource.addRestaurants(page: anyNamed('page'))).called(1);
      });

      test('should not touch the local storage when data is already loaded in memory for the same offset', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        final restaurants = await subject.getRestaurants(offset: 0);

        expect(restaurants, equals(greatestRestaurants));

        final moreRestaurants = await subject.getRestaurants(offset: 0);

        expect(moreRestaurants.length, equals(20));

        verify(localDataSource.addRestaurants(page: anyNamed('page'))).called(1);
      });

      test('should load data from local storage into memory when it is present for offset', () async {
        when(localDataSource.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        final restaurants = await subject.getRestaurants(offset: 0);

        expect(restaurants, equals(greatestRestaurants));

        final moreRestaurants = await subject.getRestaurants(offset: 0);

        expect(moreRestaurants.length, equals(20));

        verifyNever(remoteDataSoruce.getRestaurants(offset: anyNamed('offset')));
      });

      test('should load and store more data for different offsets', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return [
            for (int index = 0; index < 20; index = index + 1)
              RestaurantData(
                id: uuidv4.generate(),
                name: 'restaurant',
                price: r'$$$',
                rating: 5,
                photos: [],
                reviews: [],
                categories: [],
                location: const RestaurantLocationData(address: 'address'),
                hours: [],
              ),
          ];
        });

        await subject.getRestaurants(offset: 0);
        await subject.getRestaurants(offset: 1);
        final moreRestaurants = await subject.getRestaurants(offset: 2);

        expect(moreRestaurants.length, equals(60));

        verify(localDataSource.addRestaurants(page: anyNamed('page'))).called(3);
      });

      test('should set a restaurant as favorite and save in disk', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        final restaurants = await subject.getRestaurants(offset: 0);

        expect(restaurants, equals(greatestRestaurants));

        verify(localDataSource.addRestaurants(page: anyNamed('page'))).called(1);

        await subject.favoritate(restaurantId: '0', offset: 0, isFavorite: true);

        final favoriteRestaurants = subject.favorites;

        expect(favoriteRestaurants[0].isFavorite, isTrue);

        await subject.favoritate(restaurantId: '0', offset: 0, isFavorite: false);

        final notFavorites = subject.favorites;

        expect(notFavorites.isEmpty, isTrue);
      });

      test('should load favorite restaurants from disk', () async {
        when(localDataSource.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
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

        await subject.getRestaurants(offset: 0);

        expect(subject.favorites.isNotEmpty, isTrue);
        expect(subject.favorites[0].isFavorite, isTrue);
      });

      test('should provide review data for an specific restaurant', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        final restaurants = await subject.getRestaurants(offset: 0);

        expect(restaurants, equals(greatestRestaurants));

        verify(localDataSource.addRestaurants(page: anyNamed('page'))).called(1);

        final reviews = await subject.getReviewsForRestaurant(restaurantId: '0');

        final firstReview = reviews.first;

        expect(firstReview.text, equals('Best restaurant ever!'));
      });
    },
  );
}
