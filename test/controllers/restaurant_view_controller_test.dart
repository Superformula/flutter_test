import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:restaurant_tour/controllers/restaurant_view_controller.dart';
import 'package:restaurant_tour/data/restaurant_data_source.dart';
import 'package:restaurant_tour/data/restaurant_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/domain/get_restaurant_reviews.dart';
import 'package:restaurant_tour/domain/list_restaurants_use_case.dart';
import 'package:restaurant_tour/models/restaurant_data.dart';
import 'package:uuid/v4.dart';

@GenerateNiceMocks([
  MockSpec<RemoteRestaurantDataSource>(),
  MockSpec<InStorageRestaurantDataSource>(),
])
import 'restaurant_view_controller_test.mocks.dart';

void main() {
  group(
    'RestaurantViewController',
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
      late RestaurantViewController subject;

      setUp(() {
        remoteDataSoruce = MockRemoteRestaurantDataSource();
        localDataSource = MockInStorageRestaurantDataSource();
        restaurantRepository = RestaurantRepository(
          remoteDataSoruce: remoteDataSoruce,
          localDataSource: localDataSource,
        );

        subject = RestaurantViewController(
          getRestaurantReviewsUseCase: GetRestaurantReviewsUseCase(repository: restaurantRepository),
          listRestaurantsUseCase: ListRestaurantsUseCase(repository: restaurantRepository),
        );
      });

      test('should accumulate restaurant data when loading many restaurant data', () async {
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

        await subject.getRestaurants();
        await subject.getMoreRestaurants();
        await subject.getMoreRestaurants();

        if (subject.state case RestaurantViewModelData(restaurants: final restaurants)) {
          expect(restaurants.length, equals(60));
          expect(subject.offset, equals(3));

          verify(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).called(3);
          verify(localDataSource.addRestaurants(page: anyNamed('page'))).called(3);
        }
      });

      test('should get restaurant data for the first offset', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        await subject.getRestaurants();

        expect(
          subject.state,
          equals(RestaurantViewModel.data(restaurants: greatestRestaurants)),
        );

        expect(subject.offset, equals(1));

        verify(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).called(1);
        verify(localDataSource.addRestaurants(page: anyNamed('page'))).called(1);
      });

      test('should get restaurant data for the first offset', () async {
        when(remoteDataSoruce.getRestaurants(offset: anyNamed('offset'))).thenAnswer((invocation) async {
          return greatestRestaurants;
        });

        await subject.getRestaurants();
        await subject.getRestaurantReviews(restaurantId: '0');

        expect(
          subject.state,
          equals(RestaurantViewModel.reviews(reviews: greatestRestaurants[0].reviews)),
        );
      });
    },
  );
}
