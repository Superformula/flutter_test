import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/features/home/screen/screen.dart';

class _MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  late RestaurantRepository restaurantRepository;

  setUp(() {
    restaurantRepository = _MockRestaurantRepository();
  });

  group('app', () {
    testWidgets('Should Render Home Screen', (tester) async {
      when(() => restaurantRepository.fetchRestaurants()).thenAnswer(
        (_) async =>
            RestaurantQueryResult.fromJson(fakeRestaurants).restaurants ?? [],
      );
      await tester.pumpWidget(
        RepositoryProvider<RestaurantRepository>(
          create: (context) => restaurantRepository,
          child: const App(),
        ),
      );
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
