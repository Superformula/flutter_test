import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/models/restaurant.dart';
import 'package:restaurant_tour/repositories/restaurants_repository.dart';
import 'package:restaurant_tour/ui/screens/restaurants_list_screen/cubit.dart';
import 'package:restaurant_tour/ui/screens/restaurants_list_screen/state.dart';

void main() {
  group(
    RestaurantsListScreenCubit,
    () {
      late RestaurantsListScreenCubit cubit;

      setUp(() {
        cubit = RestaurantsListScreenCubit(
          repository: MockedRestaurantsRepository(
            minimumThrottle: 500,
            maximumThrottle: 500,
          ),
        );
      });

      test('initial state should be the data state with no restaurants', () {
        expect(
          cubit.state,
          const RestaurantsListData(),
        );
      });

      blocTest(
        '.loadRestaurants should change to the loading state and then back to the data state when the data is returned',
        build: () => cubit,
        act: (cubit) {
          cubit.loadRestaurants();
        },
        wait: const Duration(seconds: 1),
        expect: () => [
          const RestaurantsListLoading(),
          isA<RestaurantsListData>(),
        ],
      );

      blocTest(
        '.loadRestaurants should change to the loading state and then to an error state if the data fecthing is unsucessful',
        build: () {
          return RestaurantsListScreenCubit(
            repository: AlwaysErrorRestaurantsRepository(),
          );
        },
        act: (cubit) {
          cubit.loadRestaurants();
        },
        wait: const Duration(seconds: 1),
        expect: () => [
          const RestaurantsListLoading(),
          isA<RestaurantsListError>(),
        ],
      );
    },
  );
}

final class AlwaysErrorRestaurantsRepository implements RestaurantsRepository {
  @override
  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    const duration = Duration(milliseconds: 500);
    await Future.delayed(duration);

    throw Exception('Error for testing Cubit');
  }
}
