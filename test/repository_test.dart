import 'package:mockito/annotations.dart';
import 'package:restaurant_tour/repositories/yelp_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'repository_test.mocks.dart';

@GenerateMocks([YelpRepository])
void main() {
  // Create an instance of the mock
  late MockYelpRepository mockYelpRepository;

  setUp(() {
    mockYelpRepository = MockYelpRepository();
  });

  group('YelpRepository Tests', () {
    test('returns a list of restaurants when API call is successful', () async {
      // Create a fake response
      final mockRestaurants = RestaurantQueryResult(
        total: 2,
        restaurants: [
          Restaurant(
            id: '1',
            name: 'Test Restaurant',
            price: '\$\$',
            rating: 4.5,
            photos: ['https://example.com/photo.jpg'],
            categories: [Category(alias: 'italian', title: 'Italian')],
            hours: [Hours(isOpenNow: true)],
            reviews: [],
            location: Location(formattedAddress: '123 Main St'),
          ),
          Restaurant(
            id: '2',
            name: 'Another Test Restaurant',
            price: '\$\$',
            rating: 3.4,
            photos: ['https://example.com/photo2.jpg'],
            categories: [Category(alias: 'asian', title: 'asian')],
            hours: [Hours(isOpenNow: true)],
            reviews: [],
            location: Location(formattedAddress: '321 Main St'),
          ),
        ],
      );

      // Stub the mock repository to return the fake data
      when(mockYelpRepository.getRestaurants(offset: 0))
          .thenAnswer((_) async => mockRestaurants);

      // Call the method
      final result = await mockYelpRepository.getRestaurants(offset: 0);

      // Verify the interactions and results
      expect(result?.restaurants?.length, 2);
      expect(result?.restaurants?.first.name, 'Test Restaurant');
    });

  });
}