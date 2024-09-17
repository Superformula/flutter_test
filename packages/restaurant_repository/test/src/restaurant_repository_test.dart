// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_gql_client/restaurant_gql_client.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:test/test.dart';

class MockRestaurantGqlClient extends Mock implements RestaurantGqlClient {}

void main() {
  group('RestaurantRepository', () {
    late RestaurantGqlClient restaurantGqlClient;

    setUp(() {
      restaurantGqlClient = MockRestaurantGqlClient();
    });

    test('can be instantiated', () {
      expect(RestaurantRepository(restaurantGqlClient), isNotNull);
    });
  });
}
