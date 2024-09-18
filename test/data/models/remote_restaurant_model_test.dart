import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/data/models/models.dart';
import 'package:restaurant_tour/domain/entities/entities.dart';
import 'package:restaurant_tour/domain/helpers/helpers.dart';

import '../../core/factories.dart';

void main() {
  late Map restaurantJson;
  late RemoteRestaurantModel remoteRestaurantModel;

  setUp(() {
    restaurantJson = makeRemoteRestaurantsJson().first;
    remoteRestaurantModel = makeRemoteRestaurantModel();
  });

  test('Should create RemoteRestaurantModel object when json is valid', () async {
    final json = RemoteRestaurantModel.fromJson(restaurantJson);
    expect(json, isA<RemoteRestaurantModel>());
  });

  test('Should throw a unexpected error when json is not valid', () async {
    expect(() => RemoteRestaurantModel.fromJson(makeInvalidJson()), throwsA(DomainError.unexpected));
  });

  test('Should create a RestaurantEntity object', () async {
    final result = remoteRestaurantModel.toEntity();
    expect(result, isA<RestaurantEntity>());
  });
}
