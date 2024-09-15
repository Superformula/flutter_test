import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/infrastructure/datasources/restaurant_api_datasource.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/infrastructure/repositories/restaurant_repository_impl.dart';
import 'package:restaurant_tour/src/features/restaurant_tour/presentation/providers/restaurants_repository_provider.dart';

void main() {
  test(
      'restaurantsRepositoryProvider returns RestaurantRepositoryImpl instance',
      () {
    final container = ProviderContainer();

    final repository = container.read(restaurantsRepositoryProvider);

    expect(repository, isA<RestaurantRepositoryImpl>());

    final datasource = (repository).datasource;
    expect(datasource, isA<RestaurantApiDatasource>());
  });
}
