import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:restaurant_tour/app/app.dart';
import 'package:restaurant_tour/features/favorites/screen/favorites_screen.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late FavoriteCubit favoriteCubit;
  late Storage hydratedStorage;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    hydratedStorage = MockStorage();
    when(() => hydratedStorage.write(any(), any<dynamic>()))
        .thenAnswer((_) async {});

    when(() => hydratedStorage.read(any())).thenReturn({
      'restaurants': [],
    });
    HydratedBloc.storage = hydratedStorage;
    favoriteCubit = FavoriteCubit();
  });

  tearDown(() {
    favoriteCubit.close();
  });

  group('favorites', () {
    testWidgets('Should Render Favorites Screen', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (context) => FavoriteCubit(),
            child: const FavoritesScreen(),
          ),
        ),
      );
      expect(find.byType(FavoritesScreen), findsOneWidget);
    });
  });
}
